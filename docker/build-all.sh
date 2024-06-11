#!/bin/bash

# Set the image version number
facsimilab_version_num="v0.2.0c"

# Build containers
export facsimilab_version_num

cd base && bash build.sh

cd ../main && bash build.sh

cd ../full && bash build.sh


# Add additional tags
CONTAINER_NAME="facsimilab-base":$facsimilab_version_num
docker tag $CONTAINER_NAME docker.io/pranavmishra90/$CONTAINER_NAME
docker tag $CONTAINER_NAME gcr.io/pranavmishra90/$CONTAINER_NAME

CONTAINER_NAME="facsimilab-main":$facsimilab_version_num
docker tag $CONTAINER_NAME docker.io/pranavmishra90/$CONTAINER_NAME
docker tag $CONTAINER_NAME gcr.io/pranavmishra90/$CONTAINER_NAME

CONTAINER_NAME="facsimilab-full":$facsimilab_version_num
docker tag $CONTAINER_NAME docker.io/pranavmishra90/$CONTAINER_NAME
docker tag $CONTAINER_NAME gcr.io/pranavmishra90/$CONTAINER_NAME