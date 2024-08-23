#!/bin/bash

if [ -z ${facsimilab_version_num+x} ]; then facsimilab_version_num="dev"; else echo "facsimilab_version_num is set to '$facsimilab_version_num'"; fi
if [ -z ${facsimilab_username+x} ]; then facsimilab_username="root"; else echo "facsimilab_username is set to '$facsimilab_username'"; fi

# Adjust this according to the container name desired
CONTAINER_NAME="facsimilab-main-env":$facsimilab_version_num

##################################################################

# Initialize the build
start_time=$(date +%s)
iso_datetime=$(date +"%Y-%m-%dT%H:%M:%S%z")

printf "\n\n\n\n\n"
echo "-----------------------------------------"
echo "Building the following container:"
echo "$CONTAINER_NAME"

# Download necessary files
wget -nc --no-verbose https://github.com/quarto-dev/quarto-cli/releases/download/v1.4.555/quarto-1.4.555-linux-amd64.deb -O quarto.deb

######################################################################
# Build the docker container

export DOCKER_BUILDKIT=1 # use docker buildx caching
export BUILDX_METADATA_PROVENANCE=max
export IMAGE_REPO_PREFIX="pranavmishra90/"

echo "Building $CONTAINER_NAME for image export"
docker build --progress=auto \
	--build-arg IMAGE_REPO_PREFIX=$IMAGE_REPO_PREFIX \
	--build-arg IMAGE_VERSION=$facsimilab_version_num \
	--build-arg BUILDKIT_INLINE_CACHE=1 \
	--build-arg ISO_DATETIME=$iso_datetime \
	--metadata-file ../metadata/02-main-env_metadata.json \
	-t pranavmishra90/$CONTAINER_NAME \
	-t pranavmishra90/facsimilab-main-env:dev \
	-f main-py-env.Dockerfile .

main_env_sha=$(docker inspect pranavmishra90/facsimilab-main-env:dev --format '{{index .RepoDigests 0}}' | cut -d '@' -f2)


docker push pranavmishra90/facsimilab-main-env:dev
docker push pranavmishra90/$CONTAINER_NAME
#####################################################################

CONTAINER_NAME="facsimilab-main":$facsimilab_version_num

printf "\n\n\n\n\n"
echo "-----------------------------------------"
echo "Building the following container:"
echo "$CONTAINER_NAME"

# Cache export
docker buildx build --progress=plain \
	--build-arg IMAGE_REPO_PREFIX=$IMAGE_REPO_PREFIX \
	--build-arg IMAGE_VERSION=$facsimilab_version_num \
	--build-arg ISO_DATETIME=$iso_datetime \
	--build-arg MAIN_ENV_SHA=$main_env_sha \
	--build-arg BUILDKIT_INLINE_CACHE=1 \
	--cache-from=pranavmishra90/facsimilab-main:latest \
	--cache-from=pranavmishra90/facsimilab-main:dev \
	--cache-from type=registry,mode=max,oci-mediatypes=true,ref=docker.io/pranavmishra90/facsimilab-main:buildcache \
	--cache-to type=registry,mode=max,oci-mediatypes=true,ref=docker.io/pranavmishra90/facsimilab-main:buildcache \
	--metadata-file ../metadata/02-main_metadata.json \
	-t pranavmishra90/facsimilab-main:dev \
	-t $CONTAINER_NAME . -f main-stage2.Dockerfile

# Image export
docker buildx build --progress=auto \
	--build-arg IMAGE_REPO_PREFIX=$IMAGE_REPO_PREFIX \
	--build-arg IMAGE_VERSION=$facsimilab_version_num \
	--build-arg ISO_DATETIME=$iso_datetime \
	--build-arg MAIN_ENV_SHA=$main_env_sha \
	--cache-from type=registry,mode=max,oci-mediatypes=true,ref=docker.io/pranavmishra90/facsimilab-main:buildcache \
	--output type=registry,name=pranavmishra90/$CONTAINER_NAME,push=true \
	--metadata-file ../metadata/02-main_metadata.json \
	-t pranavmishra90/facsimilab-main:dev \
	-t pranavmishra90/$CONTAINER_NAME \
	-f main-stage2.Dockerfile . 



# Add additional tags
docker tag pranavmishra90/facsimilab-main:dev $CONTAINER_NAME
docker tag $CONTAINER_NAME docker.io/pranavmishra90/$CONTAINER_NAME
docker tag $CONTAINER_NAME docker.io/pranavmishra90/facsimilab-main:dev
docker tag $CONTAINER_NAME gitea.mishracloud.com/pranav/$CONTAINER_NAME

echo "pushing main-dev"
docker push -q docker.io/pranavmishra90/facsimilab-main:dev
echo "pushing $CONTAINER_NAME"
docker push -q docker.io/pranavmishra90/$CONTAINER_NAME

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