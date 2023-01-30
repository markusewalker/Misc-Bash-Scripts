#!/bin/bash

# Authored by   : Markus Walker
# Date Modified : 1/30/23

# Description   : To perform basic user management tasks such as adding a member, deleting a member, etc.

INTERACTIVE=true

if [[ $(id -u) != 0 ]];
then
	echo "ERROR. Please be sure that you are running as root or with sudo privileges!" 2>&1

	exit 1
fi

choices() {
	echo -e "\nChoose one of the options below:\n"
	echo -e "\t1: Add User"
	echo -e "\t2: Remove User"
	echo -e "\t3: Create Group"
	echo -e "\t4: Remove Group\n"
}

addUser() {
	read -p "Enter in the name of the user to add: " NAME
	useradd -m ${NAME}

	read -p "Will this user require sudo privileges ([yes] | no)?" SUDO
	[[ ${SUDO} = "yes" ]] && usermod -aG sudo ${NAME} && echo -e "Verifying if ${NAME} got added to the sudo group..." && groups ${NAME}
	[[ ${SUDO} = "no" ]] && echo "${NAME} will not receive sudo privileges."
	
	while [[ ${SUDO} != "yes" ]] && [[ ${SUDO} != "no" ]];
	do
		read -p "Please enter in a valid option (yes | no): " SUDO

		[[ ${SUDO} = "yes" ]] && usermod -aG sudo ${NAME} && echo -e "Verifying if ${NAME} got added to the sudo group..." && groups ${NAME}
		[[ ${SUDO} = "no" ]] && echo "${NAME} will not receive sudo privileges."
	done

	echo -e "Setting password for ${NAME}..."
	passwd ${NAME}
}

delUser() {
	read -p "Enter in the name of the user to delete: " NAME

	echo -e "Verifying user exists..."
	grep "^${NAME}" /etc/passwd

	echo -e "\nDeleting ${NAME}..."
	userdel ${NAME}
	rm -rf /home/${NAME}

	echo -e "Verifying if user was removed from /etc/passwd..."
	grep "^${NAME}" /etc/passwd
}

addGroup() {
	read -p "Enter in the group name you wish to add: " GROUP
	groupadd ${GROUP}

	read -p "Do you wish to add members to ${GROUP} (yes | no)? Please specify: " CHOICE

	if [[ ${CHOICE} = "yes" ]]; then
		INPUT="yes"
		while [[ ${INPUT} = "yes" ]];
		do
			read -p "Enter in a user you wish to add to ${GROUP}: " USER
			usermod -aG ${GROUP} ${USER}
			
			echo -e "Verifying if ${USER} was added to ${GROUP}..."
			grep ${GROUP} /etc/group	

			echo -e "\nDo you want to add more members (yes | no)?"
			read INPUT

			[[ "${INPUT}" = "yes" ]] && continue
			[[ "${INPUT}" = "no" ]] && echo -e "\nExiting add group option."
		done
	elif [[ ${CHOICE} = "no" ]]; then
		echo -e "\nAdding no users at this time."
	fi
}

delGroup() {
	read -p "Please enter the group you wish to delete: " GROUP
	echo -e "\nVerifying group exists..."
	getent group | grep ${GROUP}

	echo -e "\nDeleting ${GROUP}..."
	groupdel ${GROUP}

	echo -e "\nVerifying group is deleted..."
	getent group | grep ${GROUP}
}

usage() {
	cat << EOF

$(basename "$0")

This script performs basic user group and sysadmin tasks. The options are shown below:

	* Adding Members
	* Deleting Members
	* Adding Groups
	* Deleting Groups

This script can be ran interactively or silently.

USAGE: % ./$(basename "$0") [options]

OPTIONS:

	-h		-> Usage
	-a		-> Add members
	-d		-> Delete members
	-b		-> Add group
	-f		-> Delete group

EXAMPLES:

* Run script interactively

	$ ./$(basename $0)

* Add user silently

	$ ./$(basename $0) -a

EOF

}

while getopts "hadbf" opt; do
	case ${opt} in
		h)
			usage
			exit 0
			;;
		a)
			INTERACTIVE=false
			addUser
			;;
		d)
			INTERACTIVE=false
			delUser
			;;
		b)
			INTERACTIVE=false
			delUser
			;;
		f)
			INTERACTIVE=false
			delGroup
			;;
		*)
			echo "Invalid option: $OPTARG. Valid option(s) are [-h]." 2>&1
			exit 1
			;;
	esac
done

Main() {
	if [[ "${INTERACTIVE}" = true ]]; then
		echo -e "\x1B[96m======================================="
		echo -e "\tUser Management"
		echo -e "=======================================\x1B[0m"
		echo "This script performs basic user/group sysadmin tasks."
		echo -e "--------------------------------------------------------"

		choices

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

			[[ ${INPUT} = "no" ]] && echo -e "\nThanks for using this script!"
			[[ ${INPUT} = "yes" ]] && choices && continue

			while [[ ${INPUT} != "yes" ]] && [[ ${INPUT} != "no" ]];
			do
				read -p "Please enter either yes or no: " INPUT

				[[ ${INPUT} = "no" ]] && echo -e "\nThanks for using this script!"
				[[ ${INPUT} = "yes" ]] && choices && continue
			done
		done
	fi
}

Main "$@"

exit 0
