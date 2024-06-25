#!/bin/bash

# Set the image version number
facsimilab_version_num="v0.2.0"

facsimilab_username="coder"

# Build containers
#---------------------------------------------------------------------
export facsimilab_version_num
export facsimilab_username

# # Base container
cd base && bash build.sh

# CONTAINER_NAME="facsimilab-base":$facsimilab_version_num
# docker tag $CONTAINER_NAME docker.io/pranavmishra90/$CONTAINER_NAME
# docker tag $CONTAINER_NAME gcr.io/pranavmishra90/$CONTAINER_NAME

# # Main container
# cd ../main && bash build.sh

# CONTAINER_NAME="facsimilab-main":$facsimilab_version_num
# docker tag $CONTAINER_NAME docker.io/pranavmishra90/$CONTAINER_NAME
# docker tag $CONTAINER_NAME gcr.io/pranavmishra90/$CONTAINER_NAME

# Full container
cd ../full && bash build.sh

CONTAINER_NAME="facsimilab-full":$facsimilab_version_num
docker tag $CONTAINER_NAME docker.io/pranavmishra90/$CONTAINER_NAME
docker tag $CONTAINER_NAME gcr.io/pranavmishra90/$CONTAINER_NAME
