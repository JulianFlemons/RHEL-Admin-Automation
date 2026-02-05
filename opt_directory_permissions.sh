#!/bin/bash

# Directories to process
directories=("Java" "Perl" "Python" "swift" "Bash" "Clojure")

for dir in "${directories[@]}"; do
    path="/opt/$dir"
    echo "Processing $path"

    # Check if directory exists
    if [ ! -d "$path" ]; then
        echo "Directory $path does not exist — skipping"
        echo "----------------------"
        continue
    fi

    # Apply permissions based on directory name
    if [ "$dir" = "Java" ]; then
        # owner: rwx, group: r, others: none
        chmod 740 "$path"

    elif [ "$dir" = "Perl" ]; then
        # owner: rwx, group: rwx, others: r
        chmod 774 "$path"

    elif [ "$dir" = "Python" ]; then
        # owner: rwx, group: r-x, others: r-x
        chmod 755 "$path"

    elif [ "$dir" = "swift" ]; then
        # owner: rwx, group: rw, others: rw
        chmod 766 "$path"

    elif [ "$dir" = "Bash" ]; then
        # owner: rw, group: rw, others: rw
        chmod 666 "$path"

    elif [ "$dir" = "Clojure" ]; then
        # owner: rw, group: rw, others: r
        chmod 664 "$path"
    fi

    # Verification
    ls -ld "$path"
    echo "----------------------"
done

