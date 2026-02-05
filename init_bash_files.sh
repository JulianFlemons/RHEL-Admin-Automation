#!/bin/bash 

path="/root/bash"

# Check if directory exists
if [ ! -d "$path" ]; then
    echo "$path does not exist. Creating it now.."
    mkdir -p "$path"
    echo "$path is created"
fi

echo "Creating Files for $path"

# FIX: Notice the quotes end BEFORE the curly brace
touch "$path"/{Will_keep_practicing,if_not,my_loss,I_love_bash}

echo "--- Verification ---"
ls -F "$path"
