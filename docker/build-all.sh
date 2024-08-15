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
read -t 15 -p "Enter the facsimilab_version_num [default is '$set_version' (from ./image_version.txt)]: " user_input

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
export facsimilab_version_num
export facsimilab_username

# Initialize the build
start_time=$(date +%s)

printf "\n\n\n\n\n"
echo "-----------------------------------------"


# CUDA container
#----------------------
# cd cuda

# ./build.sh -d --image-name pranavmishra90/cuda --cuda-version 12.4.1 --os ubuntu --os-version 22.04 --arch x86_64 --push

# cd ..

# Base container
#----------------------
cd base

bash build.sh

docker push pranavmishra90/facsimilab-base:$facsimilab_version_num > ../log/build-base.log

# Main container
#----------------------
cd ../main && bash build.sh

docker push pranavmishra90/facsimilab-main:$facsimilab_version_num > ../log/build-main.log

# Full container
#----------------------
cd ../full

# Generate the lock file from the conda environment.yml
# bash generate-lock.sh

# Build the docker container
bash build.sh  > ../log/build-full.log


# Finished
#----------------------
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

# Play an alert tone in the terminal to mark completion'
echo -e '\a'
