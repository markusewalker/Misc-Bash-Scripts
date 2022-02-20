# Tomcat Setup

### Description
Bash script to download and setup Tomcat. The Tomcat Setup utilizes functions to perform the following actions: download Tomcat, extract Tomcat, remove the compressed folder, enable Tomcat Manager, substitue ports 8080 and 8443 with ports 80 and 443, respectiviely in the server.xml file.

### Getting Started
To utilize this script, please follow the below workflow:

(1) Clone the script into your environment.\
(2) Make sure the script is executable using the command **"chmod +x setup-tomcat.sh"**.\
(3) Navigate to the src folder and run the script: **./setup-tomcat.sh.**

See below image of the script in action:

![Setting up Tomcat](https://github.com/markusewalker/Misc-Bash-Scripts/blob/master/tomcat-setup/setup-tomcat.jpg)

### BATS Testing
Along with this script, you can perform unit testing using BATS (Bash Automated Testing System). In order to do this, you will need to ensure BATS is either installed on your system, or you directly invoke the test.bats file.

To install BATS directly on your system, following this documentation: https://bats-core.readthedocs.io/en/stable/installation.html. Once done, run the following command from directory `tomcat-setup/test/test`: `bats test.bats`

If you do not install BATS directly on your system, run the following commands from the `tomcat-setup` folder:

`git submodule add https://github.com/bats-core/bats-core.git test/bats`\
`git submodule add https://github.com/bats-core/bats-support.git test/test_helper/bats-support`\
`git submodule add https://github.com/bats-core/bats-assert.git test/test_helper/bats-assert`

Once done, run the following command from the directory `tomcat-setup` folder: `/test/bats/bin/bats test/test/test.bats`. Using either method, you should see the following:

![BATS Testing Result](https://github.com/markusewalker/Misc-Bash-Scripts/blob/master/tomcat-setup/bats.jpg)
