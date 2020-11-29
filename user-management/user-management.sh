#!/bin/bash

# Authored by   : Markus Walker
# Date Modified : 11/26/20

# Description   : To perform basic user management tasks such as adding a member, deleting a member, etc.

if [[ $(id -u) != 0 ]];
then
	echo "ERROR. Please be sure that you are running as root or with sudo privileges!" 2>&1

	exit 1
fi

# Function to add a user and assign a password.
addUser() {
	read -p "Enter in the name of the user to add: " NAME
	useradd -m ${NAME}

	# Check to see if this user will need sudo privilegs. If yes, assign to the sudo group. If not, disregard...
	read -p "Will this user require sudo privileges ([yes] | no)?" SUDO
	if [[ ${SUDO} = "yes" ]];
	then
		usermod -aG sudo ${NAME}
		echo -e "Verifying if ${NAME} got added to the sudo group..."
		groups ${NAME}
	elif [[ ${SUDO} = "no" ]];
	then
		echo "${NAME} will not receive sudo privileges."
	fi

	echo -e "Setting password for ${NAME}..."
	passwd ${NAME}
}

# Function to delete a specified user.
delUser() {
	read -p "Enter in the name of the user to delete: " NAME

	echo -e "Verifying user exists..."
	grep "^${NAME}" /etc/passwd

	echo -e "\nDeleting ${NAME}..."
	userdel ${NAME}
	rm -rf /home/${NAME}

	echo -e "Verifying if user was removed from /etc/passwd. If so, should receive a blank line..."
	grep "^${NAME}" /etc/passwd
}

# Function to add a group.
addGroup() {
	read -p "Enter in the group name you wish to add: " GROUP
	groupadd ${GROUP}

	read -p "Do you wish to add members to ${GROUP} (yes | no)? Please specify: " CHOICE

	if [[ ${CHOICE} == "yes" ]];
	then
		INPUT="yes"
		while [[ ${INPUT} = "yes" ]];
		do
			read -p "Enter in a user you wish to add to ${GROUP}: " USER
			usermod -aG ${GROUP} ${USER}
			
			echo -e "Verifying if ${USER} was added to ${GROUP}..."
			grep ${GROUP} /etc/group	

			echo -e "\nDo you want to add more members (yes | no)?"
			read INPUT

			if [[ ${INPUT} = "yes" ]];
			then
				continue
			elif [[ ${INPUT} = "no" ]];
			then
				echo -e "\nExiting add group option."
			fi

		done
	elif [[ ${CHOICE} == "no" ]];
	then
		"${USER} will not be added to ${GROUP} at this time."
	fi

}

# Function to delete a group.
delGroup() {
	read -p "Please enter the group you wish to delete: " GROUP
	echo -e "\nVerifying group exists..."
	getent group | grep ${GROUP}

	echo -e "\nDeleting ${GROUP}..."
	groupdel ${GROUP}

	echo -e "Verifying group is deleted..."
	getent group | grep ${GROUP}
}

usage() {
	cat << EOF
This script performs basic user group and sysadmin tasks. The options are shownbelow:

	- Adding Members
	- Deleting Members
	- Adding Groups
	- Deleting Groups

This script is interactive and provides basic checking & logic with each task that is specified. It is not meant to be a complex script.
EOF
}

while getopts ":h" opt; do
        case ${opt} in
                h)
                        usage
                        exit 0
                        ;;
                *)
			echo "Invalid option: $OPTARG. Valid option(s) are [-h]." 1>&2
                        exit 1
                        ;;
        esac
done

echo -e "\e[96m======================================="
echo -e "\tUser Management"
echo -e "=======================================\e[0m"
echo "This script performs basic user/group sysadmin tasks."
echo -e "--------------------------------------------------------"

# List available options.
echo -e "\nChoose one of the options below:"
echo " 1 : Add User"
echo " 2 : Remove User"
echo " 3 : Create Group"
echo " 4 : Remove Group"

INPUT="yes"
while [[ ${INPUT} = "yes" ]]
do
	read -p "Choose an option you want to do: " CHOICE
	
	case ${CHOICE} in
		1)
			addUser
			echo "";;
		2)
			delUser
			echo "";;
		3)
			addGroup
			echo "";;
		4)
			delGroup
			echo "";;
		*)
			echo -e "You MUST enter a number between 1-4.\n";;
	esac

	read -p "Do you want to continue ([yes] | no) the script? Please specify: " INPUT

	if [[ ${INPUT} = "no" ]];
	then
		echo -e "Exiting tool.\n"
	elif [[ ${INPUT} = "yes" ]];
	then
		echo ""
		continue
	fi
done

exit 0
