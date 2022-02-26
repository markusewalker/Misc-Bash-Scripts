#!/bin/bash

# Authored by   : Markus Walker
# Date Modified : 2/25/22

# Description   : To enable install ODBC 18 on a Linux or macOS machine.

# Install SQL client on a RHEL machine.
rhelSQL() {
	if [[ "$VERSION_ID" == 8.* ]]; 
	then	
		curl https://packages.microsoft.com/config/rhel/8/prod.repo > /etc/yum.repos.d/mssql-release.repo
	elif [[ "$VERSION_ID" == 7.* ]]; 
	then
		curl https://packages.microsoft.com/config/rhel/7/prod.repo > /etc/yum.repos.d/mssql-release.repo
	fi

	echo -e "\nInstalling SQL client..."

	sudo yum remove unixODBC-utf16 unixODBC-utf16-devel
	sudo ACCEPT_EULA=Y yum install -y msodbcsql18
	sudo ACCEPT_EULA=Y yum install -y mssql-tools18
	echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bashrc
	source ~/.bashrc
	sudo yum install -y unixODBC-devel
}

# Install SQL client on an Ubuntu machine.
ubuntuSQL() {
	if [[ "$VERSION_ID" == 20.04 ]]; 
	then
		curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list > /etc/apt/sources.list.d/mssql-release.list
	elif [[ "$VERSION_ID" == 18.04 ]]; 
	then
		curl https://packages.microsoft.com/config/ubuntu/18.04/prod.list > /etc/apt/sources.list.d/mssql-release.list
	fi

	echo -e "\nInstalling SQL client..."

	sudo curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
	sudo curl https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/prod.list > /etc/apt/sources.list.d/mssql-release.list

	sudo apt-get update
	sudo ACCEPT_EULA=Y apt-get install -y msodbcsql18
	sudo ACCEPT_EULA=Y apt-get install -y mssql-tools18
	echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bashrc
	source ~/.bashrc
	sudo apt-get install -y unixodbc-dev
}

# Install SQL client on a SUSE machine.
sledSQL() {
	if [[ "$VERSION_ID" == 15 ]]; 
	then
		zypper ar https://packages.microsoft.com/config/sles/15/prod.repo
	elif [[ "$VERSION_ID" == 12 ]]; 
	then
		zypper ar https://packages.microsoft.com/config/sles/12/prod.repo
	fi

	echo -e "\nInstalling SQL Client..."

	sudo ACCEPT_EULA=Y zypper install -y msodbcsql18
	sudo ACCEPT_EULA=Y zypper install -y mssql-tools18
	echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bashrc
	source ~/.bashrc
	sudo zypper install -y unixODBC-devel
}

# Install SQL client on a macOS machine.
macSQL() {
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	brew tap microsoft/mssql-release https://github.com/Microsoft/homebrew-mssql-release
	brew update
	HOMEBREW_NO_ENV_FILTERING=1 ACCEPT_EULA=Y brew install msodbcsql18 mssql-tools18
}

usage() {
	cat << EOF

install-sql-client.sh

This script will install the Microsoft ODBC driver 18 for SQL Server on a Linux or macOS machine.

You can run this script with no arguments or specify your OS silently. The examples show
how this can be done.

USAGE: % ./$(basename "$0") [options]

OPTIONS:

	-h	-> Usage
	-r	-> Install SQL Client for RHEL machines
	-u	-> Install SQL Client for Ubuntu machines
	-s	-> Install SQL Client for SUSE machines
	-a 	-> Install SQL Client on macOS machines

EXAMPLES OF USAGE:

* Install SQL Client 
	
	$ ./$(basename "$0")

* Install SQL Client on a RHEL machine
	
	$ ./$(basename "$0") -r

EOF
}

while getopts "hrusa" opt; do
	case ${opt} in
		h)
			usage
			exit 0;;
		r)
			rhelSQL
			exit 0;;
		u)
			ubuntuSQL
			exit 0;;
		s)
			sledSQL
			exit 0;;
		a)
			macSQL
			exit 0;;
		*)
			echo "Invalid option. Valid option(s) are [-h], [-r], [-c], [-u], [-s], [-a]." 2>&1
			exit 1;;
	esac
done

Main() {
	OS=`uname -s`

    echo -e "\x1B[96m===================================================="
    echo -e "\t\tInstall SQL Client"
    echo -e "====================================================\n"
    echo -e "This script will install the SQL Client on a Linux or macOS machine."
    echo -e "---------------------------------------------------------------------\x1B[0m\n"
	
	if [[ ${OS} == "Linux" ]]; then
		echo -e "\nSourcing the OS and version of machine $HOSTNAME..."
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
	elif [[ ${OS} == "Darwin" ]]; then
		macSQL
	fi
}

Main "$@"

exit 0