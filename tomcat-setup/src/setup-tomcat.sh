#!/bin/bash

# Authored by   : Markus Walker
# Date Modified : 1/30/23

# Description   : To download and install Apache Tomcat. This script is generalized, so certificates
#                 are not imported into the web server. 

if [[ $(id -u) = 0 ]];
then
   echo "ERROR. DO NOT run script as the root user. Run using a user account!" 2>&1
   exit 1
fi

download_tomcat() {
	echo -e "Downloading Tomcat...\n"
	wget https://archive.apache.org/dist/tomcat/tomcat-9/v${VERSION}/bin/apache-tomcat-${VERSION}.tar.gz -P $DIR
	cd $DIR
}

extract_tomcat() {
	echo -e "Extracting Tomcat...\n"
	tar -xf $DIR/apache-tomcat-${VERSION}.tar.gz -C $DIR
}

remove_tomcat() {
	echo -e "Removing Tomcat compressed folder...\n"
	rm -rf $DIR/apache-tomcat-${VERSION}.tar.gz
}

enable_tomcat_manager() {
	echo -e "Enabling Tomcat Manager...\n"
	sed -i '$d' $DIR/apache-tomcat-${VERSION}/conf/tomcat-users.xml
	echo '<role rolename="manager-gui"/>' >> $DIR/apache-tomcat-${VERSION}/conf/tomcat-users.xml
	echo '<user username="manager" password="manager" roles="manager-gui"/>' >> $DIR/apache-tomcat-${VERSION}/conf/tomcat-users.xml
	echo '</tomcat-users>' >> $DIR/apache-tomcat-${VERSION}/conf/tomcat-users.xml
}

disable_context_xml() {
	echo -e "Commenting out the Valve tag within the META-INF directory...\n"
	sed -i '21 s/^/<!--/' $DIR/apache-tomcat-${VERSION}/webapps/manager/META-INF/context.xml
	sed -i '23 s/^/-->/' $DIR/apache-tomcat-${VERSION}/webapps/manager/META-INF/context.xml
}

substitute_ports() {
	echo -e "Substituting ports 8080 and 8443 with ports 80 and 443 in Tomcat's server.xml file...\n"
	sed -i 's/<Connector port="8080"/<Connector port="80"/1' $DIR/apache-tomcat-${VERSION}/conf/server.xml
	sed -i 's/redirectPort="8443"/redirectPort="443"/1' $DIR/apache-tomcat-${VERSION}/conf/server.xml
}

usage() {
	cat << EOF

$(basename "$0")

This script will install the Apache Tomcat web server on your machine.

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
	echo -e "\x1B[96m=================================================="
	echo -e "\t\tSetup Tomcat"
	echo -e "==================================================\x1B[0m"          
	echo -e "This script will download, install and configure Tomcat."
	echo -e "-----------------------------------------------------------\n"

	export VERSION="9.0.71"
	export DIR="/home/ec2-user"

	download_tomcat
	extract_tomcat
	remove_tomcat
	enable_tomcat_manager
	disable_context_xml
	substitute_ports
}

Main "$@"

exit 0
