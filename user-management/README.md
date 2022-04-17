# User Management

### Description
Bash script that performs the following basic user management operations:

  - Add members
  - Delete members
  - Add groups
  - Delete groups

### Getting Started
To utilize this script, please perform the following:\
(1) Clone the script into your environment.\
(2) Make sure the script is executable using the command `chmod +x user-management.sh`.\
(3) Run the script: `./user-management.sh`. You must be the root user or have sudo privileges to run this script!

### Example
![User Management Script Example](https://github.com/markusewalker/Misc-Bash-Scripts/blob/master/user-management/example.jpb)

### BATS Testing
Along with this script, you can perform unit testing using BATS (Bash Automated Testing System). In order to do this, you will need to ensure BATS is either installed on your system, or you directly invoke the test.bats file.

If you choose to install BATS directly on your system, following this documentation: https://bats-core.readthedocs.io/en/stable/installation.html. Once done, you can simply call `bats test.bats` to run the tests. This is further explained below.

In the `user-management` folder, run the following commands:

`git init (May not be needed...)` \
`git submodule add https://github.com/bats-core/bats-core.git test/bats` \
`git submodule add https://github.com/bats-core/bats-support.git test/test_helper/bats-support` \
`git submodule add https://github.com/bats-core/bats-assert.git test/test_helper/bats-assert`

Once done, navigate to the `user-management/src` folder and perform one of the following commands:

`sudo bats test.bats` \
`sudo ../test/bats/bin/bats test.bats`

![BATS Testing Result](https://github.com/markusewalker/Misc-Bash-Scripts/blob/master/user-management/bats.jpg)

