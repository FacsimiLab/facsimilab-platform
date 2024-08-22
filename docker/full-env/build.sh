#!/bin/bash

if [ -z ${facsimilab_version_num+x} ]; then facsimilab_version_num="dev"; else echo "facsimilab_version_num is set to '$facsimilab_version_num'"; fi
if [ -z ${facsimilab_username+x} ]; then facsimilab_username="root"; else echo "facsimilab_username is set to '$facsimilab_username'"; fi

# Adjust this according to the container name desired
CONTAINER_NAME="facsimilab-full-env":$facsimilab_version_num

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
export CONDA_FILE="facsimilab-conda-lock.yml" #environment.yml

docker build --progress=auto \
	--build-arg IMAGE_REPO_PREFIX=$IMAGE_REPO_PREFIX \
	--build-arg IMAGE_VERSION=$facsimilab_version_num \
	--build-arg CONDA_FILE=$CONDA_FILE \
	--build-arg BUILDKIT_INLINE_CACHE=1 \
	--cache-from=pranavmishra90/facsimilab-full-env:latest \
	--cache-from=pranavmishra90/facsimilab-full-env:dev \
	--cache-from type=registry,mode=max,oci-mediatypes=true,ref=docker.io/pranavmishra90/facsimilab-full:buildcache \
	--metadata-file ../metadata/03-full-env_metadata.json \
	-t $CONTAINER_NAME . -f full-py-env.Dockerfile

docker tag $CONTAINER_NAME docker.io/pranavmishra90/$CONTAINER_NAME
docker tag $CONTAINER_NAME docker.io/pranavmishra90/facsimilab-full-env:dev
docker tag $CONTAINER_NAME gitea.mishracloud.com/pranav/$CONTAINER_NAME

docker push docker.io/pranavmishra90/facsimilab-full-env:dev
#####################################################################

CONTAINER_NAME="facsimilab-full":$facsimilab_version_num

docker buildx build --progress=auto \
	--build-arg IMAGE_REPO_PREFIX=$IMAGE_REPO_PREFIX \
	--build-arg IMAGE_VERSION=$facsimilab_version_num \
	--build-arg BUILDKIT_INLINE_CACHE=1 \
	--cache-from=pranavmishra90/facsimilab-full:latest \
	--cache-from=pranavmishra90/facsimilab-full:dev \
	--cache-from=pranavmishra90/facsimilab-full-env:dev \
	--cache-from type=registry,mode=max,oci-mediatypes=true,ref=docker.io/pranavmishra90/facsimilab-full:buildcache \
	--cache-to type=registry,mode=max,oci-mediatypes=true,ref=docker.io/pranavmishra90/facsimilab-full:buildcache \
	--metadata-file ../metadata/03-full_metadata.json \
	-t $CONTAINER_NAME . -f full-stage2.Dockerfile



# Add additional tags
docker tag $CONTAINER_NAME docker.io/pranavmishra90/$CONTAINER_NAME
docker tag $CONTAINER_NAME docker.io/pranavmishra90/facsimilab-full:dev
docker tag $CONTAINER_NAME gitea.mishracloud.com/pranav/$CONTAINER_NAME

docker push docker.io/pranavmishra90/facsimilab-full:dev

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
echo "                      End of base image build                          "
echo "#######################################################################"