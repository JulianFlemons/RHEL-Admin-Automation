#!/bin/bash

# List of directories to create under /opt
directories=("Java" "Perl" "Python" "swift" "Bash" "Clojure")

# Loop through each directory
for dir in "${directories[@]}"; do
    if [ -d "/opt/$dir" ]; then
        echo "Directory /opt/$dir exists."
    else
        echo "Directory /opt/$dir does not exist. Creating..."
        mkdir -p "/opt/$dir"

        # Verification
        if [ -d "/opt/$dir" ]; then
            echo "Verified: /opt/$dir was created successfully."
        else
            echo "Verification failed: /opt/$dir could not be created."
        fi
    fi
done


