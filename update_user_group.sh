#!/bin/bash



Dev=("asmith" "rjeetan" "nholiday")
Test=("bharper" "jsmith")
Prod=("lharris" "pvilceus" "jvilceus")
Unix=("econtent" "drivera")

# List of the array names to iterate through
groups=("Dev" "Test" "Prod" "Unix")

for group in "${groups[@]}"; do
    echo "--- Processing Group: $group ---"

    # Check if the group exists on the system
    if ! getent group "$group" &>/dev/null; then
        echo "Group $group does not exist on system"
        continue # Skip to next group if this one doesn't exist
    fi

    # Reference the specific array (Dev, Test, etc.)
    declare -n current_array=$group

    for user in "${current_array[@]}"; do
        # 1. Check if user exists
        if id "$user" &>/dev/null; then
            echo "User $user exists"

            # 2. Check if user is already in the group
            if id -nG "$user" | grep -qw "$group"; then
                echo "$user is already in $group"
            else
                echo "$user is NOT in $group"
		usermod -aG "$group" "$user"
	 
            fi
        else
            echo "User $user does not exist"
	
	 	

        fi
    done
    echo "" # Space between groups
done
