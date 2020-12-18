#!/bin/bash

# Authored by   : Markus Walker
# Original Date : 7/17/19
# Date Modified : 12/17/20

# Description   : To display the current Linux distro following system information: hostname, disk space,
#                 memory, uptime and active users. Utilizes flags rather than having user input.

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
    echo ${BLANK_SPACE}
}

# Display disk space usage of the system.
displayDiskSpace() {
    echo -e "${FOREGROUND_COLOR}${BACKGROUND_COLOR}*** DISK SPACE USAGE ***${DEFAULT_COLOR}\n"
    df -h
    echo ${BLANK_SPACE}
}

# Display free and used memory of the system.
displayMemory() {
    echo -e "${FOREGROUND_COLOR}${BACKGROUND_COLOR}*** MEMORY USAGE ***${DEFAULT_COLOR}\n"
    free
    echo ${BLANK_SPACE}
}

# Display uptime and load of the system.
displayUpTime() {
    echo -e "${FOREGROUND_COLOR}${BACKGROUND_COLOR}*** SYSTEM UPTIME AND LOAD ***${DEFAULT_COLOR}\n"
    uptime
    echo ${BLANK_SPACE}
}

# Display active users on the system.
displayUsers() {
    echo -e "${FOREGROUND_COLOR}${BACKGROUND_COLOR}*** ACTIVE USERS ***${DEFAULT_COLOR}\n"
    who
    echo ${BLANK_SPACE}
}

# Usage function to display help options for the script.
displayUsage() {
    echo -e "\nOptions:
             -hn | --hostname           Display Hostname
             -ds | --disk-space         Display Disk Space
             -dm | --display-memory     Display Memory
             -dt | --display-uptime     Display Uptime
             -du | --display-users      Display Active Users
             -a  | --all                Display All System Information"
}

# Usage Error function if a user enters an invalid option when running the script.
displayUsageError() {
    echo -e "\nERROR. Not a valid option. See the below options:"
    displayUsage
}

Main() {
	FOREGROUND_COLOR="\x1B[97m"
	BACKGROUND_COLOR="\x1B[104m"
	DEFAULT_COLOR="\x1B[0m"
	BLANK_SPACE=""

	# While loop that displays system information that user inputs.
	while [[ $1 = -* ]]; do
	    case $1 in 
		-hn|--hostname)
		    displayHostName
		    echo ${BLANK_SPACE}
		    exit;;
		-ds|--disk-space)
		    displayDiskSpace
		    echo ${BLANK_SPACE}
		    exit;;
		-dm|--display-memory)
		    displayMemory
		    echo ${BLANK_SPACE}
		    exit;;
		-dt|--display-uptime)
		    displayUpTime
		    echo ${BLANK_SPACE}
		    exit;;
		-du|--display-users)
		    displayUsers
		    echo ${BLANK_SPACE}
		    exit;;
		-a|--all)
		    displayHostName
		    displayDiskSpace
		    displayMemory
		    displayUpTime
		    displayUsers
		    echo ${BLANK_SPACE}
		    exit;;
		-h|--help)
		    displayUsage
			echo ${BLANK_SPACE}
			exit;;
		    *)
		    displayUsageError
		    echo ${BLANK_SPACE}
		    exit;;
	    esac
	done

	echo -e "\x1B[96m================================================\n"
	echo -e "\tDisplay System Information\n"
	echo -e "================================================\x1B[0m\n"          
	echo "This script displays information about the current system."
	echo -e "---------------------------------------------------------"

	# List options available to the user.
	echo -e "\nSee the below options for displaying information about the system."
	echo -e "\t- Display Hostname"
	echo -e "\t- Display Disk Space"
	echo -e "\t- Display Memory"
	echo -e "\t- Display Uptime"
	echo -e "\t- Display Active Users"
	echo -e "\t- Display all options"
	echo -e "\nUse the -h flag or --help flag to see the options to run the script."
}

Main "$@"

exit 0
