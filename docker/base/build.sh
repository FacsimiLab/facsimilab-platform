#!/bin/bash

if [ -z ${facsimilab_version_num+x} ]; then facsimilab_version_num="dev"; else echo "facsimilab_version_num is set to '$facsimilab_version_num'"; fi

# Adjust this according to the container name desired
CONTAINER_NAME=facsimilab-base:$facsimilab_version_num

##################################################################

# Initialize the build
start_time=$(date +%s)
iso_datetime=$(date +"%Y-%m-%dT%H:%M:%S%z")

printf "\n\n\n\n\n"
echo "-----------------------------------------"
echo "Building the following container:"
echo "$CONTAINER_NAME"

# Build the docker container
export DOCKER_BUILDKIT=1 # use docker buildx caching
export BUILDX_METADATA_PROVENANCE=max

docker pull pranavmishra90/cuda:12.4.1-base-ubuntu22.04

ubuntu_cuda_base_sha=$(docker inspect pranavmishra90/cuda:12.4.1-base-ubuntu22.04 --format '{{index .RepoDigests 0}}' | cut -d '@' -f2)

echo "SHA: $ubuntu_cuda_base_sha"


	# --build-arg CACHE_BUST=$(date) \
	# -t gitea.mishracloud.com/pranav/$CONTAINER_NAME \
# docker buildx build --progress=auto \
# 	--pull \
# 	--build-arg IMAGE_VERSION=$facsimilab_version_num \
# 	--build-arg ISO_DATETIME=$iso_datetime \
# 	--build-arg BASE_IMAGE_SHA=$ubuntu_cuda_base_sha \
# 	--cache-from pranavmishra90/facsimilab-base:dev \
# 	--cache-from type=registry,mode=max,oci-mediatypes=true,ref=docker.io/pranavmishra90/facsimilab-base:buildcache \
# 	--cache-to type=registry,mode=max,oci-mediatypes=true,ref=docker.io/pranavmishra90/facsimilab-base:buildcache \
# 	--output type=registry,push=true,name=pranavmishra90/$CONTAINER_NAME \
# 	--output type=registry,push=true,name=pranavmishra90/facsimilab-base:dev \
# 	--output type=docker,name=pranavmishra90/$CONTAINER_NAME \
# 	--output type=docker,name=pranavmishra90/facsimilab-base:dev \
# 	--metadata-file ../metadata/01-base_metadata.json \
# 	. --file Dockerfile


docker build -t pranavmishra90/$CONTAINER_NAME \
	--build-arg IMAGE_VERSION=$facsimilab_version_num \
	--build-arg ISO_DATETIME=$iso_datetime \
	--build-arg BASE_IMAGE_SHA=$ubuntu_cuda_base_sha \
	. --file ./Dockerfile

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
echo "FacsimiLab-Base Docker images: $facsimilab_version_num"
echo ""

docker image ls | grep facsimilab-base | grep $facsimilab_version_num

echo ""
echo ""
echo "FacsimiLab-Base Docker images: dev"
echo ""

docker image ls | grep facsimilab-base | grep dev

echo "#######################################################################"
echo "                      End of base image build                          "
echo "#######################################################################"