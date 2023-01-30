#!/bin/bash

# Authored by	: Markus Walker
# Date Modified : 1/30/23

# Description	: To backup the system to a mounted backup location on a weekly basis.

INTERACTIVE=true
BACKUP_FILES=""
DESTINATION=""

if [[ $(id -u) != 0 ]];
then
	echo "ERROR. Please be sure that you are running as root or with sudo privileges!" 2>&1
	exit 1
fi

backup() {
	tar -czvf ${DESTINATION}/${BACKUP_NAME} ${BACKUP_FILES}
	echo -e "\nValidating backup..."
	ls -lart ${DESTINATION} | grep ${BACKUP_NAME}

	if [[ $? -eq 0 ]]; then
		echo -e "\nBackup was successful!"
	else
		echo -e "\nBackup was unsuccessful..."
	fi
}

usage() {
	cat << EOF

$(basename "$0")

Script that will backup files/folders that the user specifies. When specfiying a folder, use the syntax
'/'. If backing up multiple folders, separate by a space. For example, '/home /usr /opt'.

Additionally, you'll be prompted for the folder location where the backup will be staged.

USAGE: % ./$(basename "$0") [options]

OPTIONS:
	-h		-> Usage
	-b		-> Specify files/folders to backup
	-d		-> Specify folder that the files/folders will be backed up to

EXAMPLES:

* Run script interactively

	% ./$(basename "$0")

* Run script silently

	% ./$(basename "$0") -b '/home /tmp' -d '/home/someuser/backups'

EOF
}

while getopts "hb:d:" opt; do
	case ${opt} in
		h)
			usage
			exit 0;;
		b)
			INTERACTIVE=false
			BACKUP_FILES=$OPTARG
			;;
		d)
			INTERACTIVE=false
			DESTINATION=$OPTARG
			;;
		*)
			echo "Invalid option. Valid option(s) are [-h, -b, -d]." 2>&1
			exit 1;;
	esac
done

Main() {
	DAY=$(date +%F)
	BACKUP_NAME="${DAY}-backup.tar.gz"

	if [[ "${INTERACTIVE}" = true ]]; then
		echo -e "\x1B[96m==============================="
		echo -e "\tBackup System"
		echo -e "===============================\x1B[0m"
		
		echo -e "The following script will backup files/folders that you specify. When backing up folders, use syntax '/'.\n"

		read -p "Please enter in the directories that you wish to backup: " BACKUP_FILES
		read -p "Please enter folder location the backup will be staged: " DESTINATION

		backup
	else
		backup
	fi
}

Main "$@"