#!/bin/bash


group=("Dev" "Test" "Prod" "sadmin" "Unix")

for group in "${group[@]}"; do 
	if getent group "$group" &>/dev/null; then
		echo "Group '$group' already exists"
	else 
		echo "Creating group '$group'"
		groupadd "$group"
	fi 

done

