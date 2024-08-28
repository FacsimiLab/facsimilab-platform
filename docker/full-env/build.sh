#!/bin/bash

if [ -z ${facsimilab_version_num+x} ]; then facsimilab_version_num="dev"; else echo "facsimilab_version_num is set to '$facsimilab_version_num'"; fi
if [ -z ${facsimilab_username+x} ]; then facsimilab_username="root"; else echo "facsimilab_username is set to '$facsimilab_username'"; fi

# Adjust this according to the container name desired
CONTAINER_NAME="facsimilab-full-env":$facsimilab_version_num

##################################################################

# Initialize the build
start_time=$(date +%s)
iso_datetime=$(date +"%Y-%m-%dT%H:%M:%S%z")

printf "\n\n\n\n\n"
echo "-----------------------------------------"
echo "Building the following container:"
echo "$CONTAINER_NAME"

######################################################################
# Build the docker container

export DOCKER_BUILDKIT=1 # use docker buildx caching
export BUILDX_METADATA_PROVENANCE=max
export IMAGE_REPO_PREFIX="pranavmishra90/"
export CONDA_FILE="facsimilab-conda-lock.yml" #environment.yml

echo "Building $CONTAINER_NAME for full image export"

docker pull pranavmishra90/facsimilab-main:$facsimilab_version_num 

docker build --progress=auto \
	--build-arg IMAGE_REPO_PREFIX=$IMAGE_REPO_PREFIX \
	--build-arg IMAGE_VERSION=$facsimilab_version_num \
	--build-arg ISO_DATETIME=$iso_datetime \
	--build-arg FULL_ENV_SHA=$full_env_sha \
	--build-arg CONDA_FILE=$CONDA_FILE \
	--build-arg BUILDKIT_INLINE_CACHE=1 \
	--output type=registry,push=true,name=pranavmishra90/$CONTAINER_NAME \
	--metadata-file ../metadata/03-full-env_metadata.json \
	-t pranavmishra90/$CONTAINER_NAME \
	-t pranavmishra90/facsimilab-full-env:dev \
	-f full-py-env.Dockerfile .

echo "confirming push of all tags"
docker push pranavmishra90/facsimilab-full-env --all-tags

full_env_sha=$(docker inspect pranavmishra90/facsimilab-full-env:dev --format '{{index .RepoDigests 0}}' | cut -d '@' -f2)

#####################################################################

CONTAINER_NAME="facsimilab-full":$facsimilab_version_num

printf "\n\n\n\n\n"
echo "-----------------------------------------"
echo "Building the following container:"
echo "$CONTAINER_NAME"

# Cache export

echo "Building the cache container"
echo ""

docker buildx build --progress=auto \
	--pull \
	--build-arg IMAGE_REPO_PREFIX=$IMAGE_REPO_PREFIX \
	--build-arg IMAGE_VERSION=$facsimilab_version_num \
	--build-arg ISO_DATETIME=$iso_datetime \
	--build-arg FULL_ENV_SHA=$full_env_sha \
	--cache-to type=registry,mode=max,oci-mediatypes=true,ref=docker.io/pranavmishra90/facsimilab-full:buildcache \
	--metadata-file ../metadata/02-full_metadata.json \
	-f full-stage2.Dockerfile .

# Image export

echo "Building the full container"
echo ""

docker buildx build --progress=auto \
	--pull \
	--build-arg IMAGE_REPO_PREFIX=$IMAGE_REPO_PREFIX \
	--build-arg IMAGE_VERSION=$facsimilab_version_num \
	--build-arg ISO_DATETIME=$iso_datetime \
	--build-arg FULL_ENV_SHA=$full_env_sha \
	--cache-from type=registry,mode=max,oci-mediatypes=true,ref=docker.io/pranavmishra90/facsimilab-full:buildcache \
	--output type=registry,push=true,name=pranavmishra90/$CONTAINER_NAME \
	--output type=registry,push=true,name=pranavmishra90/facsimilab-full:dev \
	--output type=docker,name=pranavmishra90/$CONTAINER_NAME \
	--output type=docker,name=pranavmishra90/facsimilab-full:dev \
	--metadata-file ../metadata/02-full_metadata.json \
	-f full-stage2.Dockerfile . 




# Add additional tags
docker tag pranavmishra90/$CONTAINER_NAME gitea.mishracloud.com/pranav/$CONTAINER_NAME

echo "pushing Facsimilab-Full all tags"
docker push docker.io/pranavmishra90/facsimilab-full --all-tags


# Calculate the total time
end_time=$(date +%s)
total_time=$((end_time - start_time))
minutes=$((total_time / 60))
seconds=$((total_time % 60))

# Print the completion statement
formatted_date=$(date "+%m/%d/%Y at %I:%M %p")

echo "Completed: $formatted_date"
echo "Total time taken: $minutes minutes and $seconds seconds"
echo ""
echo ""
echo "FacsimiLab-Full Docker images: $facsimilab_version_num"
echo ""

docker image ls | grep facsimilab-full | grep $facsimilab_version_num

echo ""
echo ""
echo "FacsimiLab-Full Docker images: dev"
echo ""

docker image ls | grep facsimilab-full | grep dev

echo "#######################################################################"
echo "                      End of Full image build                          "
echo "#######################################################################"