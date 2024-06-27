#!/bin/bash

if [ -z ${facsimilab_version_num+x} ]; then facsimilab_version_num="dev"; else echo "facsimilab_version_num is set to '$facsimilab_version_num'"; fi
if [ -z ${facsimilab_username+x} ]; then facsimilab_username="root"; else echo "facsimilab_username is set to '$facsimilab_username'"; fi

# Adjust this according to the container name desired
CONTAINER_NAME="facsimilab-main":$facsimilab_version_num

##################################################################

# Initialize the build
start_time=$(date +%s)

printf "\n\n\n\n\n"
echo "-----------------------------------------"
echo "Building the following container:"
echo "ghcr.io/pranavmishra90/$CONTAINER_NAME"

# Download necessary files
wget -nc https://github.com/quarto-dev/quarto-cli/releases/download/v1.4.555/quarto-1.4.555-linux-amd64.deb -O quarto.deb

# Build the docer container
export DOCKER_BUILDKIT=1 # use docker buildx caching

docker build --build-arg IMAGE_VERSION=$facsimilab_version_num -t $CONTAINER_NAME .

# Add additional tags
docker tag $CONTAINER_NAME docker.io/pranavmishra90/$CONTAINER_NAME
docker tag $CONTAINER_NAME ghcr.io/pranavmishra90/$CONTAINER_NAME

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
echo "FacsimiLab Docker images:"
echo ""

docker image ls | grep facsimilab
