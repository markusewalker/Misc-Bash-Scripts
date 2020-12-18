#!/bin/bash

# Authored by   : Markus Walker
# Original Date : 3/13/19
# Date Modified : 12/17/20

# Description   : To download various Tomcat versions on any Linux OS.
#                 This script is generalized, so certificates generation/application is not included.
#                 Assumes that the certificate has already been generated and assumes it will be applied 
#                 after the script is ran.

# Check to make sure that the script is being run as the root user.
if [[ $(id -u) = 0 ]];
then
   echo "ERROR. DO NOT run Tomcat as the root user. Run using a user account!" 2>&1
   exit 1
fi

# Download the Tomcat version. Comment out the versions you do not need, uncomment out the version that you need.
download_tomcat() {
	echo -e "Downloading Tomcat...\n"
	sleep 2
	wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.23/bin/apache-tomcat-9.0.40.tar.gz -P $HOME
	echo -e "Successfully downloaded Tomcat.\n"
}

# Extract the Tomcat downloaded file.
extract_tomcat() {
	echo -e "Extracting Tomcat...\n"
	sleep 2
	tar -xf /$HOME/apache-tomcat-9.0.40.tar.gz -C $HOME
	echo -e "Successfully extracted Tomcat.\n"
}

# Remove the Tomcat downloaded file to help clean up space.
remove_tomcat() {
	echo -e "Removing Tomcat compressed folder...\n"
	sleep 2
	rm -rf /$HOME/apache-tomcat-9.0.40.tar.gz
	echo -e "Successfully removed downloaded Tomcat compressed folder.\n"
}

# Enabling Tomcat Manager so that user can access the GUI in a browser, given that the certificate is valid.
enable_tomcat_manager() {
	echo -e "Enabling Tomcat Manager...\n"
	sleep 2
	sed -i '$d' $HOME/apache-tomcat-9.0.40/conf/tomcat-users.xml
	echo '<role rolename="manager-gui"/>' >> $HOME/apache-tomcat-9.0.40/conf/tomcat-users.xml
	echo '<user username="manager" password="manager" roles="manager-gui"/>' >> $HOME/apache-tomcat-9.0.40/conf/tomcat-users.xml
	echo '</tomcat-users>' >> $HOME/apache-tomcat-9.0.40/conf/tomcat-users.xml
	echo -e "Successfully enabled Tomcat Manager.\n"
}

# Disables the Valve tag within Tomcat's context.xml found in the META-INF directory.
disable_context_xml() {
	echo -e "Commenting out the Valve tag within the META-INF directory...\n"
	sleep 2
	sed -i '19 s/^/<!--/' $HOME/apache-tomcat-9.0.40/webapps/manager/META-INF/context.xml
	sed -i '21 s/^/-->/' $HOME/apache-tomcat-9.0.40/webapps/manager/META-INF/context.xml
	echo -e "Successfully commented out the Valve tag within the META-INF directory.\n"
}

# Substitute ports 8080 and 8443 with ports 80 and 443. Since Web Adaptor by design uses ports 80 and 443, we substitute the ports here.
substitute_ports() {
	echo -e "Substituting ports 8080 and 8443 with ports 80 and 443 in Tomcat's server.xml file...\n"
	sleep 2
	sed -i 's/<Connector port="8080"/<Connector port="80"/1' $HOME/apache-tomcat-9.0.40/conf/server.xml
	sed -i 's/redirectPort="8443"/redirectPort="443"/1' $HOME/apache-tomcat-9.0.40/conf/server.xml
	echo -e "Successfully substituted ports 8080 and 8443 with 80 and 443 in Tomcat's server.xml, respectively."
}

Main() {
	echo -e "\x1B[96m=====================================================================\n"
	echo -e "\t\t\tTomcat Setup Tool\n"
	echo -e "=====================================================================\x1B[0m\n"          
	echo -e "This script will download, install and configure Tomcat on this Linux OS."
	echo -e "This script assumes that you have a certificate and does not modify Tomcat to apply a certificate."
	echo -e "-------------------------------------------------------------------------------------------------\n"

	# Run each function in the proceeding order:
	download_tomcat
	extract_tomcat
	remove_tomcat
	enable_tomcat_manager
	disable_context_xml
	substitute_ports
}

exit 0
