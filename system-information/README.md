# System Information

### Description
Bash script that displays the following system information on the current Linux distro: hostname, disk space, memory, uptime and active users.

### Getting Started
To utilize this script, please follow the below workflow:

(1) Clone the script into your environment.\
(2) Make sure the script is executable using the command `chmod +x sys-info.sh`.\
(3) Run the script: `./sys-info.sh`.

See below an image of the script in action:
![Image of System Information](https://github.com/markusewalker/Misc-Bash-Scripts/blob/master/system-information/sys-info.jpg)

### BATS Testing
Along with this script, you can perform unit testing using BATS (Bash Automated Testing System). In order to do this, you will need to ensure BATS is either installed on your system, or you directly invoke the `test.bats` file.

If you choose to install BATS directly on your system, following this documentation: https://bats-core.readthedocs.io/en/stable/installation.html. Once done, you can simply call `bats test.bats` to run the tests. This is further explained below.

In the `system-information` folder, run the following commands:

`git init (May not be needed...)`
`git submodule add https://github.com/bats-core/bats-core.git test/bats` \
`git submodule add https://github.com/bats-core/bats-support.git test/test_helper/bats-support` \
`git submodule add https://github.com/bats-core/bats-assert.git test/test_helper/bats-assert` \

Once done, navigate to the `system-information/src` folder and perform one of the following commands:

`bats test.bats` \
`../test/bats/bin/bats test.bats` \

![BATS Image(https://github.com/markusewalker/Misc-Bash-Scripts/blob/master/system-information/bats.jpg)