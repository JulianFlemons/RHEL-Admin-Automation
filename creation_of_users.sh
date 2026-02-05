
#!/bin/bash 

PASSWORD="abcd1234"

users=("James Smith" "Leah Harris" "Paloma Vilceus" "Enmanuel Content" "Dante Rivera")

for user  in "${users[@]}"; do
	echo "$user"
	read first_name last_name <<< "$user"
	first_initial=${first_name:0:1}

	username="$first_initial$last_name"
	username_lower=${username,,}
	full_name="$first_name"" $last_name"
	if id "$username_lower" &>/dev/null; then
		echo "User $username already exists"
	else
		useradd -c "full_name" "$username_lower"
		echo "username_lower:$PASSWORD" | chpasswd



	echo "First name: $first_name"
	echo " Last name: $last_name"
	echo "First Initial: ${first_initial,,}"
	echo "Last Name Lower: ${last_name,,}"
	echo "User Name: $username_lower"
	echo "Full Name: $full_name"
	echo "----------------------"
	fi
done
