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
echo "$CONTAINER_NAME"

# Download necessary files
wget -nc --no-verbose https://github.com/quarto-dev/quarto-cli/releases/download/v1.4.555/quarto-1.4.555-linux-amd64.deb -O quarto.deb

######################################################################
# Build the docker container

export DOCKER_BUILDKIT=1 # use docker buildx caching
export BUILDX_METADATA_PROVENANCE=max
export IMAGE_REPO_PREFIX="pranavmishra90/"
export CACHEBUST="100"

docker build --progress=auto --build-arg CACHEBUST="$CACHEBUST"  \
	--build-arg IMAGE_REPO_PREFIX=$IMAGE_REPO_PREFIX \
	--build-arg IMAGE_VERSION=$facsimilab_version_num \
	--cache-from=pranavmishra90/facsimilab-main:latest \
	--cache-from=pranavmishra90/facsimilab-main:dev \
	--metadata-file ../metadata/02-main_metadata.json \
	-t $CONTAINER_NAME .

# docker buildx build --progress=auto \
# 	--pull --push \
# 	--build-arg IMAGE_REPO_PREFIX=$IMAGE_REPO_PREFIX \
# 	--build-arg IMAGE_VERSION=$facsimilab_version_num \
# 	--cache-from=pranavmishra90/facsimilab-main:latest \
# 	--cache-from=pranavmishra90/facsimilab-main:dev \
# 	--metadata-file ../metadata/02-main_metadata.json \
# 	-t pranavmishra90/$CONTAINER_NAME .


#######################################################################
# Add additional tags
docker tag $CONTAINER_NAME docker.io/pranavmishra90/$CONTAINER_NAME
docker tag $CONTAINER_NAME docker.io/pranavmishra90/facsimilab-main:dev
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
