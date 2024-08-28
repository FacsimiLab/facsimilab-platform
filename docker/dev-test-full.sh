#!/bin/bash

# Choose a version number ---------------------------------------------------------------------------------
cd $(git rev-parse --show-toplevel)
cd docker

version_file="image_version.txt"

if [ -f "$version_file" ]; then
	set_version=$(cat "$version_file" | tr -d '[:space:]')
else
	echo "Warning: $version_file not found. Using 'dev' as default."
	set_version="dev"
fi

echo "--------------------------------------------------------------------------------"
docker image ls | grep pranavmishra90/facsimilab
printf "\n\n"
echo "--------------------------------------------------------------------------------"
# Prompt the user for the version number
read -t 30 -p "Enter the facsimilab_version_num [default is '$set_version' (from ./image_version.txt)]: " user_input

# Remove any whitespace from the user input
user_input=$(echo "$user_input" | tr -d '[:space:]')

# Determine the facsimilab_version_num to use
if [ -n "$user_input" ]; then
	facsimilab_version_num="$user_input"
elif [ -n "$set_version" ]; then
	facsimilab_version_num="$set_version"
else
	echo "Warning: No default version found. Using 'dev' as default."
	facsimilab_version_num="dev"
fi

echo "FacsimiLab version: $facsimilab_version_num"

# Write the chosen version number to the version file
echo "$facsimilab_version_num" >"$version_file"

# ----------------------------------------------------------------------------------------------------------
facsimilab_username="coder"

# Build containers
#---------------------------------------------------------------------
# Full container
cd ./full

# Generate the lock file from the conda environment.yml

# Prompt the user for the version number
read -t 5 -p "Update the conda environment? (y/n) [default is 'n', 5 sec]: " user_input

# Determine the facsimilab_version_num to use
if [ "$user_input" = "n" ]; then
	echo "Skipping conda-lock generation (assuming it has already been completed)."
elif [ "$user_input" = "y" ]; then
	bash generate-lock.sh
else
	echo "Skipping conda-lock generation (assuming it has already been completed)."
fi

# bash generate-lock.sh

# Adjust this according to the container name desired
CONTAINER_NAME="facsimilab-full":$facsimilab_version_num

# Initialize the build
start_time=$(date +%s)
printf "\n\n\n\n\n"
echo "-----------------------------------------"
echo "Building the following container:"
echo "$CONTAINER_NAME"

# Build the docker container

export DOCKER_BUILDKIT=1
export BUILDX_METADATA_PROVENANCE=max
export CONDA_FILE="facsimilab-conda-lock.yml" #environment.yml
export IMAGE_REPO_PREFIX="pranavmishra90/"
export CACHEBUST="100"

docker build --cache-from=pranavmishra90/facsimilab-full:latest --cache-from=pranavmishra90/facsimilab-full:dev --build-arg IMAGE_REPO_PREFIX=$IMAGE_REPO_PREFIX --build-arg IMAGE_VERSION=latest --build-arg CONDA_FILE=$CONDA_FILE --metadata-file ../metadata/03-full_metadata.json -t $CONTAINER_NAME .

# Add additional tags
docker tag $CONTAINER_NAME docker.io/pranavmishra90/$CONTAINER_NAME
docker tag $CONTAINER_NAME gitea.mishracloud.com/pranav/$CONTAINER_NAME
docker tag $CONTAINER_NAME docker.io/pranavmishra90/facsimilab-full:dev

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
docker image ls | grep facsimilab | grep dev

# Push the dev image
docker push pranavmishra90/facsimilab-full:dev

# # Play an alert tone in the terminal to mark completion
echo -e '\a'
