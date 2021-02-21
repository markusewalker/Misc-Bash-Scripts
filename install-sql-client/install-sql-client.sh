#!/bin/bash

# Authored by   : Markus Walker
# Date Modified : 2/12/21

# Description   : To enable install SQL Client on a Linux machine.

# Check to make sure that the script is being run as the root user.
if [[ $(id -u) != 0 ]];
then
   echo "ERROR. You MUST run as the root user or with sudo privileges!" 2>&1
   exit 1
fi

# Install SQL client on a RHEL Linux machine.
rhelSQL() {
	if [[ "$VERSION_ID" == 8.* ]]; 
	then	
		curl https://packages.microsoft.com/config/rhel/8/prod.repo > /etc/yum.repos.d/mssql-release.repo
	elif [[ "$VERSION_ID" == 7.* ]]; 
	then
		curl https://packages.microsoft.com/config/rhel/7/prod.repo > /etc/yum.repos.d/mssql-release.repo
	elif [[ "$VERSION_ID" == 6.* ]]; 
	then
		curl https://packages.microsoft.com/config/rhel/6/prod.repo > /etc/yum.repos.d/mssql-release.repo
	fi

	echo -e "\nInstalling SQL client..."
	sleep 3

	yum remove unixODBC-utf16 unixODBC-utf16-devel -y
	sudo ACCEPT_EULA=Y yum install msodbcsql17 -y
	sudo ACCEPT_EULA=Y yum install mssql-tools -y
	echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile
	echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
	source ~/.bashrc
	sudo yum install unixODBC-devel -y
}

# Install SQL client on an Ubuntu machine.
ubuntuSQL() {
	if [[ "$VERSION_ID" == 20.04 ]]; 
	then
		curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list > /etc/apt/sources.list.d/mssql-release.list
	elif [[ "$VERSION_ID" == 18.04 ]]; 
	then
		curl https://packages.microsoft.com/config/ubuntu/18.04/prod.list > /etc/apt/sources.list.d/mssql-release.list
	elif [[ "$VERSION_ID" == 16.04 ]]; 
	then
		curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list > /etc/apt/sources.list.d/mssql-release.list
	fi

	echo -e "\nInstalling SQL client..."
	sleep 3

	apt update -y
	sudo ACCEPT_EULA=Y apt-get install msodbcsql17 -y
	sudo ACCEPT_EULA=Y apt-get install mssql-tools -y
	echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile
	echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
	source ~/.bashrc
	sudo apt-get install unixodbc-dev -y
}

# Install SQL client on a SuSE machine.
sledSQL() {
	if [[ "$VERSION_ID" == 15 ]]; 
	then
		zypper ar https://packages.microsoft.com/config/sles/15/prod.repo
	elif [[ "$VERSION_ID" == 12 ]]; 
	then
		zypper ar https://packages.microsoft.com/config/sles/12/prod.repo
	elif [[ "$VERSION_ID" == 11 ]]; 
	then
		zypper ar https://packages.microsoft.com/config/sles/11/prod.repo
	fi

	echo -e "\nInstalling SQL Client..."
	sleep 3

	sudo ACCEPT_EULA=Y zypper install msodbcsql17 -y
	sudo ACCEPT_EULA=Y zypper install mssql-tools -y
	echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile
	echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
	source ~/.bashrc	
	sudo zypper install unixODBC-devel -y
}

usage() {
	cat << EOF
--------------------------------------
Install SQL Client on a Linux Machine
--------------------------------------

This script will install the Microsoft ODBC driver for SQL Server on a Linux machine. The
following actions occur in the script:

	- The Linux distro and version is sourced from /etc/os-release.
	- SQL Server Client is installed based on the OS and version.

This is not an interactive script and you can specify your OS silently. The examples show
how this can be done.

USAGE: % ./$(basename "$0") [options]

OPTIONS:

	-h	-> Usage
	-r	-> Install SQL Client for RHEL machines
	-u	-> Install SQL Client for Ubuntu machines
	-s	-> Install SQL Client for SuSE machines

EXAMPLES OF USAGE:

	$ ./$(basename "$0")

	$ ./$(basename "$0") -r

EOF
}

while getopts "hrus" opt; do
	case ${opt} in
		h)
			usage
			exit 0
			echo ${BLANK_SPACE};;
		r)
			rhelSQL
			exit 0
			echo ${BLANK_SPACE};;
		u)
			ubuntuSQL
			exit 0
			echo ${BLANK_SPACE};;
		s)
			sledSQL
			exit 0
			echo ${BLANK_SPACE};;
		*)
			echo "Invalid option: $OPTARG. Valid option(s) are [-h], [-r], [-c], [-u], [-s]." 2>&1
			exit 1
			echo ${BLANK_SPACE};;
	esac
done

Main() {
	BLANK_SPACE=""

        echo -e "\x1B[96m===================================================="
        echo -e "\t\tInstall SQL Client"
        echo -e "====================================================\n"
        echo -e "This script will install the SQL Client on a Linux machine."
        echo -e "------------------------------------------------------------\x1B[0m\n"
	
	echo -e "\nSourcing the OS and version of machine $HOSTNAME..."
	sleep 3
	. /etc/os-release

	if [[ "$ID" = "rhel" ]]; 
	then
		rhelSQL
	elif [[ $ID = "ubuntu" ]]; 
	then
		ubuntuSQL
	elif [[ $ID = "sled" ]]; 
	then
		sledSQL
	fi	
}

Main "$@"
