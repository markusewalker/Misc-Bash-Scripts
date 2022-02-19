#!/bin/bash

# Authored by   : Markus Walker
# Date Modified : 2/19/22

# Description   : To download and install Apache Tomcat. This script is generalized, so certificates
#                 are not imported into the web server. 

# Check to make sure that the script is being run as the root user.
if [[ $(id -u) = 0 ]];
then
   echo "ERROR. DO NOT run Tomcat as the root user. Run using a user account!" 2>&1
   exit 1
fi

# Download the Tomcat version. Comment out the versions you do not need, uncomment out the version that you need.
download_tomcat() {
	echo -e "Downloading Tomcat...\n"
	wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.56/bin/apache-tomcat-9.0.56.tar.gz -P $HOME
	echo -e "Successfully downloaded Tomcat.\n"
}

# Extract the Tomcat downloaded file.
extract_tomcat() {
	echo -e "Extracting Tomcat...\n"
	tar -xf $HOME/apache-tomcat-9.0.56.tar.gz -C $HOME
	echo -e "Successfully extracted Tomcat.\n"
}

# Remove the Tomcat downloaded file to help clean up space.
remove_tomcat() {
	echo -e "Removing Tomcat compressed folder...\n"
	rm -rf $HOME/apache-tomcat-9.0.56.tar.gz
	echo -e "Successfully removed downloaded Tomcat compressed folder.\n"
}

# Enabling Tomcat Manager so that user can access the GUI in a browser, given that the certificate is valid.
enable_tomcat_manager() {
	echo -e "Enabling Tomcat Manager...\n"
	sed -i '$d' $HOME/apache-tomcat-9.0.56/conf/tomcat-users.xml
	echo '<role rolename="manager-gui"/>' >> $HOME/apache-tomcat-9.0.56/conf/tomcat-users.xml
	echo '<user username="manager" password="manager" roles="manager-gui"/>' >> $HOME/apache-tomcat-9.0.56/conf/tomcat-users.xml
	echo '</tomcat-users>' >> $HOME/apache-tomcat-9.0.56/conf/tomcat-users.xml
	echo -e "Successfully enabled Tomcat Manager.\n"
}

# Disables the Valve tag within Tomcat's context.xml found in the META-INF directory.
disable_context_xml() {
	echo -e "Commenting out the Valve tag within the META-INF directory...\n"
	sed -i '21 s/^/<!--/' $HOME/apache-tomcat-9.0.56/webapps/manager/META-INF/context.xml
	sed -i '23 s/^/-->/' $HOME/apache-tomcat-9.0.56/webapps/manager/META-INF/context.xml
	echo -e "Successfully commented out the Valve tag within the META-INF directory.\n"
}

# Substitute ports 8080 and 8443 with ports 80 and 443. Since Web Adaptor by design uses ports 80 and 443, we substitute the ports here.
substitute_ports() {
	echo -e "Substituting ports 8080 and 8443 with ports 80 and 443 in Tomcat's server.xml file...\n"
	sed -i 's/<Connector port="8080"/<Connector port="80"/1' $HOME/apache-tomcat-9.0.56/conf/server.xml
	sed -i 's/redirectPort="8443"/redirectPort="443"/1' $HOME/apache-tomcat-9.0.56/conf/server.xml
	echo -e "Successfully substituted ports 8080 and 8443 with 80 and 443 in Tomcat's server.xml, respectively."
}

usage() {
	cat << EOF

setup-tomcat.sh

This script will install the Apache Tomcat web server on your machine. To keep things simple,
this script will install Tomcat in the user's home directory that is running the script.

USAGE: % ./$(basename "$0") [options]

OPTIONS:
	-h	-> Usage

EXAMPLES:
	$ ./$(basename "$0")

EOF
}

while getopts "h" opt; do
	case ${opt} in
		h)
			usage
			exit 0;;
		*)
			echo "Invalid option: $OPTARG. Valid option(s) are [-h]." 2>&1
			exit 1;;
	esac
done

Main() {
	echo -e "\x1B[96m======================================================="
	echo -e "\t\tSetup Tomcat"
	echo -e "=======================================================\x1B[0m"          
	echo -e "This script will download, install and configure Tomcat. This script assumes that you have a"
	echo -e "certificate and does not modify Tomcat to apply a certificate."
	echo -e "-------------------------------------------------------------------------------------------------\n"

	download_tomcat
	extract_tomcat
	remove_tomcat
	enable_tomcat_manager
	disable_context_xml
	substitute_ports
}

Main "$@"

exit 0
