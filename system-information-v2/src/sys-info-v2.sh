#!/bin/bash

# Authored by   : Markus Walker
# Date Modified : 1/30/23

# Description   : To display the current Linux distro following system information: hostname, disk space,
#                 memory, uptime and active users. Utilizes flags rather than having user input.

INTERACTIVE=true
FOREGROUND_COLOR="\x1B[97m"
BACKGROUND_COLOR="\x1B[104m"
DEFAULT_COLOR="\x1B[0m"

choices() {
	echo -e "\nSee the below options for displaying information about the system."
	echo -e "1:\t Display Hostname"
	echo -e "2:\t Display Disk Space"
	echo -e "3:\t Display Memory"
	echo -e "4:\t Display Uptime"
	echo -e "5:\t Display Active Users"
	echo -e "6:\t Display all options\n"
}

displayHostName() {
    echo -e "${FOREGROUND_COLOR}${BACKGROUND_COLOR}*** HOSTNAME INFORMATION ***${DEFAULT_COLOR}\n"
    hostnamectl
}

displayDiskSpace() {
    echo -e "${FOREGROUND_COLOR}${BACKGROUND_COLOR}*** DISK SPACE USAGE ***${DEFAULT_COLOR}\n"
    df -h
}

displayMemory() {
    echo -e "${FOREGROUND_COLOR}${BACKGROUND_COLOR}*** MEMORY USAGE ***${DEFAULT_COLOR}\n"
    free
}

displayUpTime() {
    echo -e "${FOREGROUND_COLOR}${BACKGROUND_COLOR}*** SYSTEM UPTIME AND LOAD ***${DEFAULT_COLOR}\n"
    uptime
}

displayUsers() {
    echo -e "${FOREGROUND_COLOR}${BACKGROUND_COLOR}*** ACTIVE USERS ***${DEFAULT_COLOR}\n"
    who
}

usage() {
    cat << EOF

$(basename "$0")

Script that will display the system information including the following:

    * Hostname
    * Disk space
    * Memory
    * Uptime
    * Active users

This script can be ran interactively or silently, sys-info.sh only allows
for an interactive run.

USAGE: % ./$(basename "$0") [options]

OPTIONS:

	-h		-> Usage
	-n		-> Display hostname
	-s		-> Display disk space
	-m		-> Display memory
	-t		-> Display uptime
	-u		-> Display active users
	-a		-> Display all system information

EXAMPLES OF USAGE:

* Run script interactively

	$ ./$(basename "$0")

* Display hostname

	$ ./$(basename "$0") -n

* Display hostname and memory

	$ ./$(basename "$0") -n -m

EOF
}

while getopts "hnsmtua" opt; do
	case ${opt} in
		h)
			usage
            exit 0;;
		n)
			INTERACTIVE=false
			displayHostName
			;;
		s)
			INTERACTIVE=false
			displayDiskSpace
			;;
		m)
			INTERACTIVE=false
			displayMemory
			;;
		t)
			INTERACTIVE=false
			displayUpTime
			;;
		u)
			INTERACTIVE=false
			displayUsers
			;;
		a)
			INTERACTIVE=false
			displayHostName
			displayDiskSpace
			displayMemory
			displayUpTime
			displayUsers
			;;
		*)
			echo "Invalid option. Valid option(s) are [-h, -n, -s, -m, -t, -u, -a]." 2>&1
			exit 1;;
	esac
done

Main() {
	if [[ "${INTERACTIVE}" = true ]]; then
		echo -e "\x1B[96m================================================"
		echo -e "\tDisplay System Information"
		echo -e "================================================\x1B[0m"          
		echo -e "This script displays information about the current system."
		echo -e "---------------------------------------------------------"

		INPUT="yes"
		while [[ "${INPUT}" = "yes" ]]
		do
			choices
			read -p "Please enter which option you would like to use: " CHOICE

			case "${CHOICE}" in
				1)
					displayHostName
					echo "";;
				2)
					displayDiskSpace
					echo "";;
				3)
					displayMemory
					echo "";;
				4)
					displayUpTime
					echo "";;
				5)
					displayUsers
					echo "";;
				6)
					displayHostName
					displayDiskSpace
					displayMemory
					displayUpTime
					displayUsers
					echo "";;
				*)
					echo -e "You must enter a number between 1-6 ONLY.\n";;
			esac
		
			read -p "Do you want to continue? Enter 'yes' or 'no': " INPUT

			[[ "${INPUT}" = "no" ]] && echo -e "\nThank you for using the script!"
			[[ "${INPUT}" = "yes" ]] && continue

			while [[ "${INPUT}" != "yes" && "${INPUT}" != "no" ]]
			do
				read -p "Please enter 'yes' or 'no': " INPUT
				
				[[ "${INPUT}" = "no" ]] && echo -e "\nThank you for using the script!"
				[[ "${INPUT}" = "yes" ]] && continue
			done
		done
	fi
}

Main "$@"

exit 0
