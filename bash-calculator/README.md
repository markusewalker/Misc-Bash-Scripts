# Bash Calculator

### Description
Bash script that functions as a simple calculator performing addition, subtraction, multiplication and division. Integers and floating point numbers are both accepted in this calculator. The user can specify which operation is performed however many times they wish to and can end the program at any time that they are satisfied.

### Getting Started
To utilize this script, please follow the below workflow:

(1) Clone the script into your environment.\
(2) Make sure the script is executable using the command **"chmod +x calculator.sh"**.\
(3) Run the script: **./calculator.sh.**

See below an image of the script in action:
![Image of Calculator](https://github.com/markusewalker/Misc-Bash-Scripts/blob/master/bash-calculator/calculator.jpg)

### BATS Testing
Along with this script, you can perform unit testing using BATS (Bash Automated Testing System). In order to do this, you will need to ensure BATS is either installed on your system, or you directly invoke the test.bats file.

To install BATS directly on your system, following this documentation: https://bats-core.readthedocs.io/en/stable/installation.html. Once done, run the following command from directory `bash-calculator/test/test`: `bats test.bats`

If you do not install BATS directly on your system, run the following commands from the `bash-calculator` folder:

`git submodule add https://github.com/bats-core/bats-core.git test/bats`\
`git submodule add https://github.com/bats-core/bats-support.git test/test_helper/bats-support`\
`git submodule add https://github.com/bats-core/bats-assert.git test/test_helper/bats-assert`

Once done, run the following command from the directory `bash-calculator` folder: `/test/bats/bin/bats test/test/test.bats`. Using either method, you should see the following:

![BATS Testing Result](https://github.com/markusewalker/Misc-Bash-Scripts/blob/master/tomcat-setup/bats.jpg)