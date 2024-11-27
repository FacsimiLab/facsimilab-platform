#!/bin/bash


# Report errors and exit if detected
trap 'echo "Error on line $LINENO: $BASH_COMMAND"; exit 1' ERR
set -e


if [ -f ~/miniforge3/etc/profile.d/conda.sh ]; then
    source ~/miniforge3/etc/profile.d/conda.sh
    conda activate base
    echo "Conda environment: $(conda info --envs | grep '*' | awk '{print $1}')"
else
		echo "Conda environment not found. Using system Python."
fi

iso_datetime=$(date +"%Y-%m-%dT%H:%M:%S%z")


# Choose a version number ---------------------------------------------------------------------------------

# Detect the semantic release version number
cd $(git rev-parse --show-toplevel)
semvar_version=$(semantic-release version --print 2>/dev/null)


# Go back into the docker directory
cd docker

# We may read the "image_version.txt" if we cannot get a semantic release version
version_file="image_version.txt"

if git rev-parse --git-dir > /dev/null 2>&1; then
    echo "Semantic Release Auto Version: '$semvar_version'"

    if [ -n "$semvar_version" ]; then
        set_version="v$semvar_version"
        echo "$set_version" > "$version_file"

    else
        if [ -f "$version_file" ]; then
            set_version=$(<"$version_file" tr -d '[:space:]')
        else
            echo "Warning: $version_file not found. Using 'dev' as default."
            set_version="dev"
        fi
    fi
else
    echo "Not a Git repository. Using $version_file or 'dev' as default."
    if [ -f "$version_file" ]; then
        set_version=$(<"$version_file" tr -d '[:space:]')
    else
        echo "Warning: $version_file not found. Using 'dev' as default."
        set_version="dev"
    fi
fi

echo "building Version: $set_version"


echo "--------------------------------------------------------------------------------"
docker image ls | grep pranavmishra90/facsimilab
printf "\n\n"
echo "--------------------------------------------------------------------------------"
facsimilab_version_num=$set_version

echo "FacsimiLab version: $facsimilab_version_num"

# Write the chosen version number to the version file
echo "$facsimilab_version_num" >"$version_file"

# Write these values to the env file
echo "ISO_DATETIME=$iso_datetime" > .env
echo "IMAGE_VERSION=$facsimilab_version_num" >> .env

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
cd cuda

./build.sh -d --image-name pranavmishra90/cuda --cuda-version 12.6.1 --os ubuntu --os-version 22.04 --arch x86_64 --push

cd ..

# # Base container
# #----------------------
cd base

# bash build.sh

# # Main container
# #----------------------
# cd ../main

# bash build.sh


# Full container
#----------------------
# cd ../full

# # Generate the lock file from the conda environment.yml
# # bash generate-lock.sh

# # Build the docker container
# bash build.sh

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
