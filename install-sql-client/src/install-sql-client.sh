#!/bin/bash

# Authored by   : Markus Walker
# Date Modified : 1/30/23

# Description   : To enable install ODBC 18 on a Linux or macOS machine.

rhelSQL() {
	if [[ "${VERSION_ID}" == 8.* ]]; 
	then	
		curl https://packages.microsoft.com/config/rhel/8/prod.repo > /etc/yum.repos.d/mssql-release.repo
	elif [[ "${VERSION_ID}" == 7.* ]]; 
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

ubuntuSQL() {
	if ! [[ "18.04 20.04 22.04" == *"$(lsb_release -rs)"* ]];
	then
		echo "Ubuntu $(lsb_release -rs) is not currently supported.";
		exit;
	fi

	echo -e "\nInstalling SQL client..."

	curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
	curl https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/prod.list > /etc/apt/sources.list.d/mssql-release.list	

	sudo apt-get update
	sudo ACCEPT_EULA=Y apt-get install -y msodbcsql18
	sudo ACCEPT_EULA=Y apt-get install -y mssql-tools18
	echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bashrc
	source ~/.bashrc
	sudo apt-get install -y unixodbc-dev
}

slesSQL() {
	curl -O https://packages.microsoft.com/keys/microsoft.asc
	sudo rpm --import microsoft.asc

	if [[ "${VERSION_ID}" == 15 ]]; 
	then
		zypper ar https://packages.microsoft.com/config/sles/15/prod.repo
	elif [[ "${VERSION_ID}" == 12 ]]; 
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

macSQL() {
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	brew tap microsoft/mssql-release https://github.com/Microsoft/homebrew-mssql-release
	brew update
	HOMEBREW_NO_ENV_FILTERING=1 ACCEPT_EULA=Y brew install msodbcsql18 mssql-tools18
}

usage() {
	cat << EOF

$(basename "$0")

This script will install the Microsoft ODBC driver 18 for SQL Server on a Linux or macOS machine.

USAGE: % ./$(basename "$0") [options]

OPTIONS:

	-h	-> Usage

EXAMPLES OF USAGE:

* Install SQL Client 
	
	$ ./$(basename "$0")

EOF
}

while getopts "h" opt; do
	case ${opt} in
		h)
			usage
			exit 0;;
		*)
			echo "Invalid option. Valid option(s) are: [-h]" 2>&1
			exit 1;;
	esac
done

Main() {
	OS=`uname -s`

    echo -e "\x1B[96m===================================================="
    echo -e "\t\tInstall SQL Client"
    echo -e "====================================================\n"
    echo -e "This script will install the SQL Client on a Linux or macOS machine."
    echo -e "---------------------------------------------------------------------\x1B[0m"
	
	if [[ ${OS} == "Linux" ]]; then
		. /etc/os-release

		if [[ "${ID}" = "rhel" ]]; 
		then
			rhelSQL
		elif [[ ${ID} = "ubuntu" ]]; 
		then
			ubuntuSQL
		elif [[ ${ID} = "sles" ]]; 
		then
			slesSQL
		fi	
	elif [[ ${OS} == "Darwin" ]]; then
		macSQL
	fi
}

Main "$@"