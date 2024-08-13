#!/bin/bash

if [ -z ${facsimilab_version_num+x} ]; then facsimilab_version_num="dev"; else echo "facsimilab_version_num is set to '$facsimilab_version_num'"; fi

# Adjust this according to the container name desired
CONTAINER_NAME=facsimilab-base:$facsimilab_version_num

##################################################################

# Initialize the build
start_time=$(date +%s)

printf "\n\n\n\n\n"
echo "-----------------------------------------"
echo "Building the following container:"
echo "$CONTAINER_NAME"

# Build the docker container
export DOCKER_BUILDKIT=1 # use docker buildx caching
export BUILDX_METADATA_PROVENANCE=max
docker build --progress=auto --build-arg IMAGE_VERSION=$facsimilab_version_num --cache-from=pranavmishra90/facsimilab-base:latest --metadata-file ../metadata/01-base_metadata.json -t $CONTAINER_NAME .

# Add additional tags
docker tag $CONTAINER_NAME docker.io/pranavmishra90/$CONTAINER_NAME
docker tag $CONTAINER_NAME gitea.mishracloud.com/pranav/$CONTAINER_NAME

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
echo "FacsimiLab Docker images: $facsimilab_version_num"
echo ""

docker image ls | grep facsimilab | grep $facsimilab_version_num
