#!/bin/bash

# Authored by   : Markus Walker
# Date Modified : 4/16/22

# Description   : To display the current Linux distro following system information: hostname, disk space,
#                 memory, uptime and active users. Utilizes flags rather than having user input.

INTERACTIVE=true
FOREGROUND_COLOR="\x1B[97m"
BACKGROUND_COLOR="\x1B[104m"
DEFAULT_COLOR="\x1B[0m"

# Check to make sure that the script is being run as the root user.
if [[ $(id -u) != 0 ]];
then
   echo "ERROR. Must be root or have sudo privileges!" 2>&1
   exit 1
fi

# Display hostname of the system.
displayHostName() {
    echo -e "${FOREGROUND_COLOR}${BACKGROUND_COLOR}*** HOSTNAME INFORMATION ***${DEFAULT_COLOR}"
    hostnamectl
    echo ""
}

# Display disk space usage of the system.
displayDiskSpace() {
    echo -e "${FOREGROUND_COLOR}${BACKGROUND_COLOR}*** DISK SPACE USAGE ***${DEFAULT_COLOR}\n"
    df -h
    echo ""
}

# Display free and used memory of the system.
displayMemory() {
    echo -e "${FOREGROUND_COLOR}${BACKGROUND_COLOR}*** MEMORY USAGE ***${DEFAULT_COLOR}\n"
    free
    echo ""
}

# Display uptime and load of the system.
displayUpTime() {
    echo -e "${FOREGROUND_COLOR}${BACKGROUND_COLOR}*** SYSTEM UPTIME AND LOAD ***${DEFAULT_COLOR}\n"
    uptime
    echo ""
}

# Display active users on the system.
displayUsers() {
    echo -e "${FOREGROUND_COLOR}${BACKGROUND_COLOR}*** ACTIVE USERS ***${DEFAULT_COLOR}\n"
    who
    echo ""
}

usage() {
    cat << EOF

sys-info-v2.sh

Script that will display the system information including the following:

    - Hostname
    - Disk space
    - Memory
    - Uptime
    - Active users
    - All of the above

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

	$ ./$(basename "$0") -hn

* Display hostname and memory

	$ ./$(basename "$0") -hn -dm

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
		echo "This script displays information about the current system."
		echo -e "---------------------------------------------------------"

		INPUT="yes"
		while [[ ${INPUT} = "yes" ]]
		do
			# List options available to the user.
			echo -e "\nSee the below options for displaying information about the system."
			echo -e "(1):\t Display Hostname"
			echo -e "(2):\t Display Disk Space"
			echo -e "(3):\t Display Memory"
			echo -e "(4):\t Display Uptime"
			echo -e "(5):\t Display Active Users"
			echo -e "(6):\t Display all options\n"

			# Prompt the user to choose an option.
			read -p "Please enter which option you would like to use: " CHOICE

			case ${CHOICE} in
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
		
			# Prompt user if they wish to continue running the script or end it.
			read -p "Do you want to continue? Enter 'yes' or 'no': " INPUT

			if [[ ${INPUT} = "no" ]];
			then
				echo ""

			elif [[ ${INPUT} = "yes" ]];
			then    
				echo ""
				continue
			fi
		done
	fi
}

Main "$@"

exit 0
