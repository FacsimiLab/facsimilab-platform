#!/bin/bash


# Report errors and exit if detected
trap 'logger ERROR "line $LINENO: $BASH_COMMAND"; exit 1' ERR
set -e

SCRIPT_DIR="$(dirname "$(realpath "$0")")"
cd "$SCRIPT_DIR"
echo "Current directory is: " $(pwd)

############################################################################################################
# Functions
############################################################################################################

# Function to get the current date and time in ISO 8601 format
current_datetime() {
    date +"%Y-%m-%dT%H:%M:%S%:z"
}

# Function to send notifications
send_notification() {
    local message="$1"
    local response
    response=$(curl -s \
        -H "Authorization: Bearer $NTFY_DRPM_TOKEN" \
        -H "Markdown: yes" \
        -H "Title: FacsimiLab - Build" \
        -d "$message" \
        https://ntfy.drpranavmishra.com/faxlab-dev)
    
    if [ $? -ne 0 ]; then
        echo "Error occurred while sending ntfy message. Continuing execution..."
    fi
    # Optionally log the response if needed
    # echo "$response"
}

LOG_FILE="log/docker-build.log"

if [ ! -f "$LOG_FILE" ]; then
  touch "$LOG_FILE"
fi

# Function to log messages with levels and optional notification
logger() {
    local LEVEL=$1
    shift
    local TIMESTAMP=$(current_datetime)
    local MESSAGE="$@"
    
    # Log message to terminal and file
    case "$LEVEL" in
        INFO|DEBUG)
            echo -e "\e[33m$TIMESTAMP [$LEVEL] $MESSAGE\e[0m" | tee -a "$LOG_FILE"
            ;;
        WARN|ERROR|CRITICAL)
            echo -e "\e[31m$TIMESTAMP [$LEVEL] $MESSAGE\e[0m" | tee -a "$LOG_FILE"
            send_notification "$TIMESTAMP [$LEVEL] $MESSAGE"
            ;;
        *)
            echo "$TIMESTAMP [UNKNOWN] $MESSAGE" | tee -a "$LOG_FILE"
            ;;
    esac
}

############################################################################################################
# Global variables and environment
############################################################################################################

logger INFO "FacsimiLab: Build process initiated"


# Variables
ISO_DATETIME=$(current_datetime)
facsimilab_username="coder"
base_image_name="nvidia/cuda:12.6.3-base-ubuntu22.04"
DOCKER_BUILDKIT=1 # use docker buildx caching
BUILDX_METADATA_PROVENANCE=max
IMAGE_REPO_PREFIX="docker.io/pranavmishra90/"
cache_registry="docker.io/pranavmishra90"

LOG_FILE="log/docker-build.log"


if [ -f ./token.secrets ]; then
    source ./token.secrets
else
		logger INFO "No token.secrets file found. Skipping..."
fi

if [ -f ./parameters/build_parameters ]; then
    source ./parameters/build_parameters
else
		logger ERROR "No build_parameters file found"
    build_base=true
    build_main=true
    build_full=true
    generate_conda_lock=false
    build_python_images=false
    logger INFO "Building all images"
    MAIN_IMAGE_CONDA_FILE="main-conda-lock.yml"
    FULL_IMAGE_CONDA_FILE="facsimilab-conda-lock.yml"
fi

logger INFO "ISO_DATETIME: $ISO_DATETIME"
logger INFO "Build base: $build_base"
logger INFO "Build main: $build_main"
logger INFO "Build full: $build_full"
logger INFO "DOCKER_BUILDKIT: $DOCKER_BUILDKIT"
logger INFO "BUILDX_METADATA_PROVENANCE: $BUILDX_METADATA_PROVENANCE"

logger INFO "base_image_name: $base_image_name"
logger INFO "IMAGE_REPO_PREFIX: $IMAGE_REPO_PREFIX" 
logger INFO "cache_registry: $cache_registry"

logger INFO "facsimilab_username: $facsimilab_username"
logger INFO "generate conda lock files: $generate_conda_lock"
logger INFO "CUDA Version for conda: $CONDA_OVERRIDE_CUDA"
logger INFO "main image conda file: $MAIN_IMAGE_CONDA_FILE"
logger INFO "full image conda file: $FULL_IMAGE_CONDA_FILE"
logger INFO "build python images: $build_python_images"

if [ -f ./parameters/quarto_version ]; then
    source ./parameters/quarto_version
    logger INFO "Quarto version: $quarto_version"
else
		logger ERROR "No quarto_version file found"
    quarto_version="1.6.1"
    logger INFO "Quarto version: $quarto_version"
fi

# Activate the conda environment
if [ -f ~/miniforge3/etc/profile.d/conda.sh ]; then
    source ~/miniforge3/etc/profile.d/conda.sh
    conda activate base
    logger INFO "Conda environment: $(conda info --envs | grep '*' | awk '{print $1}')"
else
		logger WARN "Conda environment not found. Using system Python."
fi

# Check if python-semantic-release is installed, if not, install it
if ! semantic-release >/dev/null 2>&1; then
  logger WARN "python-semantic-release not found. Installing..."
  pip install python-semantic-release
fi


############################################################################################################
# Begin
############################################################################################################
logger INFO "FacsimiLab: Build process started"
send_notification "FacsimiLab: Build process started"


# Choose a version number ---------------------------------------------------------------------------------

# Detect the semantic release version number
cd "$SCRIPT_DIR"
cd ../
logger INFO "Checking the semantic version at: $(pwd)"
semvar_version=$(semantic-release version --print 2>/dev/null || echo "NA")


# We may read the "image_version.txt" if we cannot get a semantic release version
version_file="docker/image_version.txt"

if git rev-parse --git-dir > /dev/null 2>&1; then
  logger INFO "Semantic Release Auto Version: '$semvar_version'"

  if [ "$semvar_version" != "NA" ]; then
    set_version="v$semvar_version"
    echo "$set_version" > "$version_file"
  fi
else
  if [ -f "$version_file" ]; then
    set_version=$(<"$version_file" tr -d '[:space:]')
  else
    logger WARN "$version_file not found. Using 'dev' as default."
    set_version="dev"
  fi
fi
facsimilab_version_num=$set_version
logger INFO "Building FacsimiLab version: $set_version"

# Write the chosen version number to the version file
echo "$facsimilab_version_num" >"$version_file"

# Write these values to the env file
echo "ISO_DATETIME=$ISO_DATETIME" > .env
echo "IMAGE_VERSION=$facsimilab_version_num" >> .env
echo "BASE_IMAGE_NAME=$base_image_name" >> .env
echo "IMAGE_REPO_PREFIX=$IMAGE_REPO_PREFIX" >> .env

# Go back to the build directory
cd docker
logger INFO "Changing the working directory for the docker build: $(pwd)"

# ----------------------------------------------------------------------------------------------------------


# Generate conda lock files

if [ "$generate_conda_lock" = true ]; then
  (
    bash ./main/generate-base-conda-lock.sh
    logger INFO "Conda lock file generated for the base environment (main container)"
  ) &

  (
    bash ./full/generate-facsimilab-conda-lock.sh
    logger INFO "Conda lock file generated for the facsimilab environment (full container)"
  ) &

  wait
else
  logger INFO "Skipping conda lock file generation for the base and facsimilab environments (main and full containers, respectively)"
fi

# Parse base-conda-lock.yml
base_env_conda_lock_hash=$(awk '/content_hash:/ {getline; print}' ./main/python-env/base-conda-lock.yml | awk '{print $2}')
logger INFO "Base environment conda-lock hash: $base_env_conda_lock_hash"

facsimilab_env_conda_lock_hash=$(awk '/content_hash:/ {getline; print}' ./full/python-env/facsimilab-conda-lock.yml | awk '{print $2}')
logger INFO "Facsimilab environment conda-lock hash: $facsimilab_env_conda_lock_hash"

# Build containers
#---------------------------------------------------------------------

# Initialize the build
start_time=$(date +%s)

printf "\n\n\n\n\n"
echo "-----------------------------------------"



# # CUDA container
# #----------------------


# if ! docker buildx inspect cuda; then
#     docker buildx create --use --platform linux/x86_64 --driver-opt image=moby/buildkit:v0.18.1 --name cuda --node cuda
# fi

# cd cuda
# ./build.sh -d --image-name docker.io/pranavmishra90/cuda --cuda-version 12.6.3 --os ubuntu --os-version 22.04 --arch x86_64 --push
# cd ..

# # Base container
# #----------------------

# Ensure that the CUDA base image is available and get its information
docker pull ${base_image_name}
ubuntu_cuda_base_sha=$(docker inspect ${base_image_name} --format '{{index .RepoDigests 0}}' | cut -d '@' -f2)
logger INFO "Ubuntu CUDA SHA: $ubuntu_cuda_base_sha"



if [ -n "$base_image_name" ] && [ -n "$ubuntu_cuda_base_sha" ]; then
  exact_base="${base_image_name}@${ubuntu_cuda_base_sha}"
  echo "BASE_IMAGE_SHA=$ubuntu_cuda_base_sha" >> .env
  echo "BASE_IMAGE_EXACT=$exact_base" >> .env
	logger INFO "Base image: $exact_base"
else
  logger ERROR "base_image_name or ubuntu_cuda_base_sha is not defined or empty."
  exit 1
fi

CONTAINER_NAME=facsimilab-base:$facsimilab_version_num

if [ "$build_base" = true ]; then

  docker buildx build \
    --build-arg IMAGE_VERSION=$facsimilab_version_num \
    --build-arg ISO_DATETIME=$ISO_DATETIME \
    --build-arg BASE_IMAGE_EXACT=$exact_base \
    --build-arg BASE_IMAGE_NAME=$base_image_name \
    --build-arg BASE_IMAGE_SHA=$ubuntu_cuda_base_sha \
    --cache-from type=registry,mode=max,ref=$cache_registry/facsimilab-base:buildcache \
    --cache-to type=registry,mode=max,ref=$cache_registry/facsimilab-base:buildcache \
    --output type=registry,push=true,name=pranavmishra90/$CONTAINER_NAME \
    --output type=registry,push=true,name=pranavmishra90/facsimilab-base:dev \
    --output type=docker,name=pranavmishra90/$CONTAINER_NAME \
    --metadata-file ./metadata/01-base_metadata.json \
    ./base --file ./base/base.Dockerfile

  logger INFO "Base container built: pranavmishra90/$CONTAINER_NAME"

else
  logger INFO "Skipping base container build"
fi

# Get the SHA of the base environment's python image
docker pull pranavmishra90/$CONTAINER_NAME
BASE_IMAGE_SHA=$(docker inspect pranavmishra90/$CONTAINER_NAME --format '{{index .RepoDigests 0}}' | cut -d '@' -f2)
echo "BASE_IMAGE_SHA=$BASE_IMAGE_SHA" >> .env
logger INFO "Base image SHA: $BASE_IMAGE_SHA"

# Main container
#----------------------
echo "---------------------------------------------------------------"
printf "\n\n\n\n\n"
echo "---------------------------------------------------------------"

CONTAINER_NAME="facsimilab-main-env":$facsimilab_version_num
CONDA_FILE=$MAIN_IMAGE_CONDA_FILE




# Build the python environment for the main container
if [ "$build_python_images" = true ]; then
  logger INFO "Building $CONTAINER_NAME"
  logger INFO "Conda file: $MAIN_IMAGE_CONDA_FILE"

  docker build --progress=auto \
    --build-arg IMAGE_REPO_PREFIX=$IMAGE_REPO_PREFIX \
    --build-arg IMAGE_VERSION=$facsimilab_version_num \
    --build-arg ISO_DATETIME=$iso_datetime \
    --build-arg MAIN_IMAGE_CONDA_FILE=$MAIN_IMAGE_CONDA_FILE \
    --metadata-file ./metadata/02-main-env_metadata.json \
    -t pranavmishra90/$CONTAINER_NAME \
    -t pranavmishra90/facsimilab-main-env:dev \
    -t $cache_registry/facsimilab-main-env:$facsimilab_version_num \
    -f ./main/main-py-env.Dockerfile ./main

    docker push pranavmishra90/$CONTAINER_NAME
    docker push pranavmishra90/facsimilab-main-env:dev

  PYTHON_ENV_IMAGE_VERSION=$facsimilab_version_num
else
  logger INFO "Skipping python environment build for the main image"
  PYTHON_ENV_IMAGE_VERSION="dev"
fi

logger INFO "Python environment image version: $PYTHON_ENV_IMAGE_VERSION"

# Get the SHA of the main environment's python image
docker pull pranavmishra90/facsimilab-main-env:$PYTHON_ENV_IMAGE_VERSION
MAIN_ENV_SHA=$(docker inspect pranavmishra90/facsimilab-main-env:$PYTHON_ENV_IMAGE_VERSION --format '{{index .RepoDigests 0}}' | cut -d '@' -f2)
echo "MAIN_ENV_SHA=$MAIN_ENV_SHA" >> .env
logger INFO "Building the main image using the python environment: facsimilab-main-env:${PYTHON_ENV_IMAGE_VERSION}@${MAIN_ENV_SHA}"

if [ -f ./main/quarto.deb ]; then
  logger INFO "Quarto package already downloaded"
else
  logger INFO "Downloading Quarto version: ${quarto_version} - https://github.com/quarto-dev/quarto-cli/releases/download/v${quarto_version}/quarto-${quarto_version}-linux-amd64.deb"
  wget "https://github.com/quarto-dev/quarto-cli/releases/download/v${quarto_version}/quarto-${quarto_version}-linux-amd64.deb" -O ./main/quarto.deb
fi


CONTAINER_NAME="facsimilab-main":$facsimilab_version_num
logger INFO "Building $CONTAINER_NAME"


if [ "$build_main" = true ]; then

  docker buildx build --progress=auto \
    --pull \
    --build-arg IMAGE_REPO_PREFIX=$IMAGE_REPO_PREFIX \
    --build-arg IMAGE_VERSION=$facsimilab_version_num \
    --build-arg PYTHON_ENV_IMAGE_VERSION=$PYTHON_ENV_IMAGE_VERSION \
    --build-arg ISO_DATETIME=$ISO_DATETIME \
    --build-arg MAIN_ENV_SHA=$MAIN_ENV_SHA \
    --cache-from type=registry,mode=max,ref=$cache_registry/facsimilab-main:buildcache \
    --cache-to type=registry,mode=max,ref=$cache_registry/facsimilab-main:buildcache \
    --output type=registry,push=true,name=pranavmishra90/$CONTAINER_NAME \
    --output type=registry,push=true,name=pranavmishra90/facsimilab-main:dev \
    --output type=docker,name=pranavmishra90/$CONTAINER_NAME \
    --output type=docker,name=pranavmishra90/facsimilab-main:dev \
    --metadata-file ./metadata/02-main_metadata.json \
    -f ./main/main-stage2.Dockerfile ./main

  logger INFO "Base container built: pranavmishra90/$CONTAINER_NAME"
else
  logger WARN "Skipping main image build"
fi



# Full container
#-----------------------------------------------------------------------
echo "---------------------------------------------------------------"
printf "\n\n\n\n\n"
echo "---------------------------------------------------------------"

CONTAINER_NAME="facsimilab-full-env":$facsimilab_version_num

logger INFO "Building $CONTAINER_NAME"
logger INFO "Conda file: $FULL_IMAGE_CONDA_FILE"

docker pull docker.io/pranavmishra90/facsimilab-main:$facsimilab_version_num

# Build the python environment for the full container
if [ "$build_python_images" = true ]; then
  

  docker build --progress=plain \
    --build-arg IMAGE_REPO_PREFIX=$IMAGE_REPO_PREFIX \
    --build-arg IMAGE_VERSION=$facsimilab_version_num \
    --build-arg ISO_DATETIME=$ISO_DATETIME \
    --build-arg PYTHON_ENV_IMAGE_VERSION=$PYTHON_ENV_IMAGE_VERSION \
    --build-arg FULL_IMAGE_CONDA_FILE=$FULL_IMAGE_CONDA_FILE \
    --output type=registry,push=false,name=pranavmishra90/$CONTAINER_NAME \
    --metadata-file ./metadata/03-full-env_metadata.json \
    -t pranavmishra90/$CONTAINER_NAME \
    -t pranavmishra90/facsimilab-full-env:dev \
    -t localhost:5000/facsimilab-full-env:dev \
    -t localhost:5000/$CONTAINER_NAME \
    -f ./full/full-py-env.Dockerfile ./full
  PYTHON_ENV_IMAGE_VERSION=$facsimilab_version_num


else
  logger INFO "Skipping python environment build for the FULL image"
  PYTHON_ENV_IMAGE_VERSION="dev"
fi

if [ "$GITHUB_ACTIONS" == "true" ]; then
  logger INFO "Running in GitHub Actions"
  PUSH_LOCATION="pranavmishra90"
else
  logger INFO "Not running in GitHub Actions"
  PUSH_LOCATION="localhost:5000"

fi

logger INFO "Push location: $PUSH_LOCATION/$CONTAINER_NAME"
docker push $PUSH_LOCATION/$CONTAINER_NAME
docker push $PUSH_LOCATION/facsimilab-full-env:dev


logger INFO "Python environment image version: $PYTHON_ENV_IMAGE_VERSION"


# Get the SHA of the full environment's python image
docker pull $PUSH_LOCATION/facsimilab-full-env:$PYTHON_ENV_IMAGE_VERSION
FULL_ENV_SHA=$(docker inspect $PUSH_LOCATION/facsimilab-full-env:$PYTHON_ENV_IMAGE_VERSION --format '{{index .RepoDigests 0}}' | cut -d '@' -f2)
echo "FULL_ENV_SHA=$FULL_ENV_SHA" >> .env
logger INFO "Building the full image using the python environment: facsimilab-full-env:${PYTHON_ENV_IMAGE_VERSION}@${FULL_ENV_SHA}"




# Start building the full container
CONTAINER_NAME="facsimilab-full":$facsimilab_version_num


if [ "$build_full" = true ]; then
docker buildx build --progress=auto \
	--pull \
	--build-arg IMAGE_REPO_PREFIX=$IMAGE_REPO_PREFIX \
	--build-arg IMAGE_VERSION=$facsimilab_version_num \
	--build-arg ISO_DATETIME=$ISO_DATETIME \
	--build-arg FULL_ENV_SHA=$FULL_ENV_SHA \
	--cache-from type=registry,mode=max,oci-mediatypes=true,ref=docker.io/pranavmishra90/facsimilab-full:buildcache \
	--cache-to type=registry,mode=max,oci-mediatypes=true,ref=docker.io/pranavmishra90/facsimilab-full:buildcache \
	--output type=registry,push=true,name=pranavmishra90/$CONTAINER_NAME \
  --output type=registry,push=true,name=pranavmishra90/facsimilab-full:dev \
	--output type=docker,name=pranavmishra90/$CONTAINER_NAME \
	--metadata-file ./metadata/02-full_metadata.json \
	-f ./full/full-stage2.Dockerfile ./full 

  logger INFO "Full container built: pranavmishra90/$CONTAINER_NAME"

else
  logger WARN "Skipping full image build"
fi

############################################################################################################
# Results
############################################################################################################

git add image_version.txt metadata/ parameters/ main/ full/ 


# Calculate the total time
end_time=$(date +%s)
total_time=$((end_time - start_time))
minutes=$((total_time / 60))
seconds=$((total_time % 60))

echo ""
echo ""
echo "FacsimiLab Docker images: $facsimilab_version_num"
echo ""


# Check if the Docker image exists
if docker image ls | grep facsimilab | grep $facsimilab_version_num; then
  echo "Docker image $facsimilab_version_num exists"
else
  logger ERROR "No FacsimiLab Docker images found"
fi

############################################################################################################
# Complete
############################################################################################################
logger INFO "FacsimiLab: Build process completed"
logger INFO "Total time taken: $minutes minutes and $seconds seconds"
send_notification "FacsimiLab: Build process completed"
echo -e '\a'