#!/bin/bash

if [ -z ${facsimilab_version_num+x} ]; then facsimilab_version_num="dev"; else echo "facsimilab_version_num is set to '$facsimilab_version_num'"; fi

# Adjust this according to the container name desired
CONTAINER_NAME=facsimilab-base:$facsimilab_version_num

if [ -z ${base_image_name+x} ]; then base_image_name="dev"; else echo "base_image_name is set to '$base_image_name'"; fi

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

docker pull ${base_image_name}

ubuntu_cuda_base_sha=$(docker inspect ${base_image_name} --format '{{index .RepoDigests 0}}' | cut -d '@' -f2)

echo "SHA: $ubuntu_cuda_base_sha"

if [ -n "$base_image_name" ] && [ -n "$ubuntu_cuda_base_sha" ]; then
  exact_base="${base_image_name}@${ubuntu_cuda_base_sha}"
	echo "Base image: $exact_base"
else
  echo "Error: base_image_name or ubuntu_cuda_base_sha is not defined or empty."
  exit 1
fi

docker build -t pranavmishra90/$CONTAINER_NAME \
	--build-arg IMAGE_VERSION=$facsimilab_version_num \
	--build-arg ISO_DATETIME=$iso_datetime \
	--build-arg BASE_IMAGE_EXACT=$exact_base \
	--build-arg BASE_IMAGE_NAME=$base_image_name \
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