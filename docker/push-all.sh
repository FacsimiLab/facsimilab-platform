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
read -t 10 -p "Enter the facsimilab_version_num [default is '$set_version' (from ./image_version.txt)]: " user_input

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

# ----------------------------------------------------------------------------------------------------------

# Check if facsimilab_version_num is 'dev'
if [ "$facsimilab_version_num" == "dev" ]; then
	echo "Version is dev. Performing development actions..."
	# Put your development actions here

	CONTAINER_NAME="facsimilab-base:$facsimilab_version_num"
	docker tag $CONTAINER_NAME gitea.mishracloud.com/pranav/facsimilab-base:dev

	CONTAINER_NAME="facsimilab-main:$facsimilab_version_num"
	docker tag $CONTAINER_NAME gitea.mishracloud.com/pranav/facsimilab-main:dev

	CONTAINER_NAME="facsimilab-full:$facsimilab_version_num"
	docker tag $CONTAINER_NAME gitea.mishracloud.com/pranav/facsimilab-full:dev

else

	# Base image
	CONTAINER_NAME="facsimilab-base:$facsimilab_version_num"
	docker tag $CONTAINER_NAME docker.io/pranavmishra90/facsimilab-base:latest
	docker tag $CONTAINER_NAME gitea.mishracloud.com/pranav/facsimilab-base:latest

	# Main image
	CONTAINER_NAME="facsimilab-main:$facsimilab_version_num"

	docker tag $CONTAINER_NAME docker.io/pranavmishra90/facsimilab-main:latest
	docker tag $CONTAINER_NAME gitea.mishracloud.com/pranav/facsimilab-main:latest

	# Full image
	CONTAINER_NAME="facsimilab-full:$facsimilab_version_num"

	docker tag $CONTAINER_NAME docker.io/pranavmishra90/facsimilab-full:latest
	docker tag $CONTAINER_NAME gitea.mishracloud.com/pranav/facsimilab-full:latest

	echo "--------------------------------------------------------------------------------"
	docker image ls | grep -e pranavmishra90/facsimilab -e gitea.mishracloud.com
	printf "\n\n"
	echo "--------------------------------------------------------------------------------"

	# # Begin Push

	echo "Starting to push images to Gitea and DockerHub"

	# rm ./log/*_push.log


	# DockerHub section

	docker push docker.io/pranavmishra90/facsimilab-base:$facsimilab_version_num
	docker push docker.io/pranavmishra90/facsimilab-main:$facsimilab_version_num
	docker push docker.io/pranavmishra90/facsimilab-full:$facsimilab_version_num
	docker push docker.io/pranavmishra90/facsimilab-base:latest
	docker push docker.io/pranavmishra90/facsimilab-main:latest
	docker push docker.io/pranavmishra90/facsimilab-full:latest

	# # Gitea section
	# docker push gitea.mishracloud.com/pranav/facsimilab-base:$facsimilab_version_num
	# docker push gitea.mishracloud.com/pranav/facsimilab-main:$facsimilab_version_num
	# docker push gitea.mishracloud.com/pranav/facsimilab-full:$facsimilab_version_num
	# docker push gitea.mishracloud.com/pranav/facsimilab-base:latest
	# docker push gitea.mishracloud.com/pranav/facsimilab-main:latest
	# docker push gitea.mishracloud.com/pranav/facsimilab-full:latest


	echo "All Docker push operations completed."

fi

# Play an alert tone in the terminal to mark completion
echo -e '\a'
