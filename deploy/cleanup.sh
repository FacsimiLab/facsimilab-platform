#!/bin/bash

# When you attach VSCode to a docker container and bind-mount the volume using read-write permissions, the directory can get messy with many folders created. Use this to clean it up.

rm -rf .cache .config .dotnet .gnupg .ipython/ .nv .ssh .vscode-server/ .local micromamba/ .bashrc .bash_history
