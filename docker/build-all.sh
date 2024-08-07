#!/bin/bash

# Choose a version number ---------------------------------------------------------------------------------
version_file="build_version.txt"

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
read -t 30 -p "Enter the facsimilab_version_num [default is '$set_version' (from ./build_version.txt)]: " user_input

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

# # # # Base container
# cd base

# bash build.sh

# # # Main container
# cd ../main && bash build.sh

# # Full container
# cd ../full && bash build.sh

# # Play an alert tone in the terminal to mark completion
# echo -e '\a'
