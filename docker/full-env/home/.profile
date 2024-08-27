#!/bin/bash

# Join Message
server_name=$(cat ~/.server_name.txt)

echo -e "\e[1;31m$server_name\e[0m"

# Set Windows Terminal Tab Name
echo -ne "\033]0;$server_name\a"

# PATH
export PATH="/home/coder/.local/bin:$PATH"

# Join paragraph

echo """
Welcome to the Facsimilab suite of docker images.
For more information, please visit github.com/pranavmishra90/facsimilab-platform

Available python environments:
"""

micromamba env list

echo """
----------------------------------------------------------------------------------
"""

alias mamba='micromamba'


# Bash Formatting
function color_my_prompt {
    local __user_and_host="\[\033[00;37m\]\u\[\033[01;32m\]@\h"
    local __cur_location="\[\033[01;34m\]\W"
    local __git_branch_color="\[\033[31m\]"
    #local __git_branch="\`ruby -e \"print (%x{git branch 2> /dev/null}.grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`"
    local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
    local __last_color="\[\033[00m\]:"
    export PS1="$__user_and_host $__cur_location $__git_branch_color$__git_branch$__prompt_tail$__last_color "
}

color_my_prompt