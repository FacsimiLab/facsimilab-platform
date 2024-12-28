#!/bin/bash

if [ -z ${facsimilab_version_num+x} ]; then facsimilab_version_num="dev"; else echo "facsimilab_version_num is set to '$facsimilab_version_num'"; fi
if [ -z ${facsimilab_username+x} ]; then facsimilab_username="root"; else echo "facsimilab_username is set to '$facsimilab_username'"; fi

# Adjust this according to the container name desired
CONTAINER_NAME="facsimilab-main-env":$facsimilab_version_num
cache_registry="docker.io/pranavmishra90" #"localhost:5000" # "docker.io/pranavmishra90"
##################################################################

# Initialize the build
start_time=$(date +%s)
iso_datetime=$(date +"%Y-%m-%dT%H:%M:%S%z")

printf "\n\n\n\n\n"
echo "-----------------------------------------"
echo "Building the following container:"
echo "$CONTAINER_NAME"

# Download necessary files

quarto_version="1.6.39"

wget -nc --no-verbose https://github.com/quarto-dev/quarto-cli/releases/download/v$quarto_version/quarto-$quarto_version-linux-amd64.deb -O quarto.deb


######################################################################
# Build the docker container

export DOCKER_BUILDKIT=1 # use docker buildx caching
export BUILDX_METADATA_PROVENANCE=max
export IMAGE_REPO_PREFIX="pranavmishra90/"

docker pull pranavmishra90/facsimilab-base:$facsimilab_version_num 

# echo "Building $CONTAINER_NAME for image export"
# docker build --progress=plain \
# 	--build-arg IMAGE_REPO_PREFIX=$IMAGE_REPO_PREFIX \
# 	--build-arg IMAGE_VERSION=$facsimilab_version_num \
# 	--build-arg BUILDKIT_INLINE_CACHE=1 \
# 	--build-arg ISO_DATETIME=$iso_datetime \
# 	--metadata-file ../metadata/02-main-env_metadata.json \
# 	-t pranavmishra90/$CONTAINER_NAME \
# 	-t pranavmishra90/facsimilab-main-env:dev \
# 	-t $cache_registry/facsimilab-main-env:$facsimilab_version_num \
# 	-f main-py-env.Dockerfile .

# # docker push pranavmishra90/facsimilab-main-env:dev
# # docker push pranavmishra90/$CONTAINER_NAME

# docker push $cache_registry/$CONTAINER_NAME

main_env_sha=$(docker inspect pranavmishra90/facsimilab-main-env:dev --format '{{index .RepoDigests 0}}' | cut -d '@' -f2)

#####################################################################

CONTAINER_NAME="facsimilab-main":$facsimilab_version_num

printf "\n\n\n\n\n"
echo "-----------------------------------------"
echo "Building the following container:"
echo "$CONTAINER_NAME"

# IMAGE_REPO_PREFIX="localhost:5000/"

# # Cache export
# docker buildx build --progress=auto \
# 	--pull \
# 	--build-arg IMAGE_REPO_PREFIX=$IMAGE_REPO_PREFIX \
# 	--build-arg IMAGE_VERSION=$facsimilab_version_num \
# 	--build-arg ISO_DATETIME=$iso_datetime \
# 	--build-arg MAIN_ENV_SHA=$main_env_sha \
# 	--build-arg BUILDKIT_INLINE_CACHE=1 \
# 	--cache-from=pranavmishra90/facsimilab-main:latest \
# 	--cache-from=$cache_registry/$CONTAINER_NAME \
# 	--cache-from type=registry,mode=max,ref=$cache_registry/facsimilab-main:buildcache \
# 	--cache-to type=registry,mode=max,ref=$cache_registry/facsimilab-main:buildcache \
# 	--metadata-file ../metadata/02-main_metadata.json \
# 	-t pranavmishra90/facsimilab-main:dev \
# 	-t $CONTAINER_NAME . -f main-stage2.Dockerfile

# Image export
docker buildx build --progress=auto \
	--pull \
	--build-arg IMAGE_REPO_PREFIX=$IMAGE_REPO_PREFIX \
	--build-arg IMAGE_VERSION=$facsimilab_version_num \
	--build-arg ISO_DATETIME=$iso_datetime \
	--build-arg MAIN_ENV_SHA=$main_env_sha \
	--cache-from type=registry,mode=max,ref=$cache_registry/facsimilab-main:buildcache \
	--output type=registry,push=true,name=pranavmishra90/$CONTAINER_NAME \
	--output type=registry,push=false,name=pranavmishra90/facsimilab-main:dev \
	--output type=docker,name=pranavmishra90/$CONTAINER_NAME \
	--output type=docker,name=pranavmishra90/facsimilab-main:dev \
	--metadata-file ../metadata/02-main_metadata.json \
	-f main-stage2.Dockerfile . 



# # Add additional tags
# docker tag pranavmishra90/facsimilab-main:dev $CONTAINER_NAME
# docker tag $CONTAINER_NAME docker.io/pranavmishra90/$CONTAINER_NAME
docker tag $CONTAINER_NAME docker.io/pranavmishra90/facsimilab-main:dev
# docker tag $CONTAINER_NAME gitea.mishracloud.com/pranav/$CONTAINER_NAME

echo "pushing main-dev"
docker push -q docker.io/pranavmishra90/facsimilab-main:dev
# echo "pushing $CONTAINER_NAME"
# docker push -q docker.io/pranavmishra90/$CONTAINER_NAME

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
echo "FacsimiLab-Main Docker images: $facsimilab_version_num"
echo ""

docker image ls | grep facsimilab-main | grep $facsimilab_version_num

echo ""
echo ""
echo "FacsimiLab-Main Docker images: dev"
echo ""

docker image ls | grep facsimilab-main | grep dev

echo "#######################################################################"
echo "                      End of Main image build                          "
echo "#######################################################################"
