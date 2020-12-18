#!/bin/bash

# Authored by	: Markus Walker
# Original Date : 3/15/19
# Date Modified : 12/17/20

# Description	: To backup the system to a mounted backup location and to run weekly on schedule.

# Perform quick error checking to verify that the user is running as root or with sudo privileges.
if [[ $(id -u) != 0 ]];
then
	echo "ERROR. Please be sure that you are running as root or with sudo privileges!" 2>&1
	exit 1
fi

echo -e "\e[96m====================================="
echo -e "\tBackup System Tool"
echo -e "=====================================\e[0m\n"
echo "Beginning to execute backupSystem.sh..."
echo -e "The following script will backup the following directories: /boot, /etc, /home, /opt, /sys/, /usr.\n"
sleep 2

# List directories to backup.
BACKUP_FILES="/boot /etc /home /opt /sys /usr"

# Destination where the backup will go to.
DESTINATION="/mnt/backup"

# Create backup filename.
DAY=$(date +%A)
BACKUP_NAME="${HOSTNAME}-${DAY}.tar.gz"

# Backup the specified files.
tar -cJf ${DESTINATION}/${BACKUP_NAME} ${BACKUP_FILES}

echo -e "Successfully completed backup.\n"

exit 0
