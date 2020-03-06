#!/bin/bash

# Authored by   : Markus Walker
# Original Date : 7/5/19
# Date Modified : 7/5/19

# Description   : To display the current Linux distro following system information: hostname, disk space,
#                 memory, uptime and active users.

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

echo -e "\e[96m================================================\n"
echo -e "\tDisplay System Information\n"
echo -e "================================================\e[0m\n"          
echo "This script displays information about the current system."
echo -e "---------------------------------------------------------"

# List options available to the user.
echo -e "\nSee the below options for displaying information about the system."
echo -e "(1):\t Display Hostname"
echo -e "(2):\t Display Disk Space"
echo -e "(3):\t Display Memory"
echo -e "(4):\t Display Uptime"
echo -e "(5):\t Display Active Users"
echo -e "(6):\t Display all options\n"

FOREGROUND_COLOR="\e[97m"
BACKGROUND_COLOR="\e[104m"
DEFAULT_COLOR="\e[0m"
BLANK_SPACE=""

INPUT="yes"
while [[ ${INPUT} = "yes" ]]
do
    # Prompt the user to choose an option.
    read -p "Please enter which option you would like to use: " CHOICE

    case ${CHOICE} in 
        1)
            displayHostName
            echo ${BLANK_SPACE};;
        2)
            displayDiskSpace
            echo ${BLANK_SPACE};;
        3)
            displayMemory
            echo ${BLANK_SPACE};;
        4)
            displayUpTime
            echo ${BLANK_SPACE};;
        5)
            displayUsers
            echo ${BLANK_SPACE};;
        6)
            displayHostName
            displayDiskSpace
            displayMemory
            displayUpTime
            displayUsers
            echo ${BLANK_SPACE};;
        *)
            echo -e "You must enter a number between 1-6 ONLY.\n";;
    esac

    # Prompt user if they wish to continue running the script or end it.
    echo "Do you want to continue? Enter 'yes' or 'no'."
    read INPUT

    if [[ ${INPUT} = "no" ]];
    then
        echo -e ${BLANK_SPACE}
        
    elif [[ ${INPUT} = "yes" ]];
    then    
        echo ${BLANK_SPACE}
        continue
    fi
done

exit 0
