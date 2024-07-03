#!/bin/bash

# Join Message
server_name=$(cat ~/.server_name.txt )

echo -e "\e[1;31m$server_name\e[0m"

# Set Windows Terminal Tab Name
echo -ne "\033]0;$server_name\a"


# Join paragraph

echo """
Welcome to the Facsimilab suite of docker images.

For more information, please visit github.com/pranavmishra90/facsimilab-platform

----------------------------------------------------------------------------------
"""


# Aliases
alias mamba='micromamba'