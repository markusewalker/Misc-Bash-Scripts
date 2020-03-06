# Tomcat Setup
DESCRIPTION
-
Bash script to download various Tomcat versions on various Linux distros. Inspired to be utilized with the ArcGIS Enterprise stack and Tomcat versions 8.5.23, 8.0.48, 7.0.82. As the ArcGIS Web Adaptor lists these versions in the system requirements, these versions in particular are used.

The Tomcat Setup utilizes functions to perform the following actions: download Tomcat, extract Tomcat, remove the compressed folder, enable Tomcat Manager, substitue ports 8080 and 8443 with ports 80 and 443, respectiviely in the server.xml file.

This script was developed on developed on Ubuntu 16.04LTS and tested with. Ubuntu 16.04 &18.04, RHEL 7.5 & 7.6. Although this script has not been tested on other distros, little to no changes should be made necessary to the script.

GETTING STARTED
-
To utilize this script, please follow the below workflow:

(1) Clone the script into your environment.\
(2) Make sure the script is executable using the command **"chmod +x setupTomcat.sh"**.\
(3) Run the script: **./setupTomcat.sh.**

See below images of the script in action:

*Downloading Tomcat*

*Extracting Tomcat*

*Removing downloaded file*

*Enabling Tomcat Manager*

*Substitue ports*
