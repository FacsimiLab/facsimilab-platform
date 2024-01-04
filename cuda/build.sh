#!/bin/bash

# Adjust this according to the container name desired
CONTAINER_NAME="singulab-vscoder-cuda:dev"


##################################################################

# Initialize the build
start_time=$(date +%s)

echo "Building the following container:"
echo "gcr.io/pranavmishra90/$CONTAINER_NAME"

# Build the docer container
export DOCKER_BUILDKIT=1 # use docker buildx caching

docker build --build-arg CACHE_BUST=$(date +%s) -t $CONTAINER_NAME .

# Add additional tags
docker tag $CONTAINER_NAME docker.io/pranavmishra90/$CONTAINER_NAME
docker tag $CONTAINER_NAME gcr.io/pranavmishra90/$CONTAINER_NAME

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
echo "Singulab Docker images:"
echo ""

docker image ls | grep singulab
