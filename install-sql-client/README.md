# Install SQL Client

### Description
Bash script that installs the Microsoft SQL Client driver 18 on one of the following Linux distributions:
  - 7.x or 8.x
  - 18.04 or 20.04
  - SuSE 12 or SuSE 15

Additionally, this script also will install the Microsoft SQL Client driver 18 on a macOS machine.

### Getting Started
To utilize this script, please perform the following:\
(1) Clone the script into your environment.\
(2) Make sure the script is executable using the command **chmod +x install-sql-client.sh**.\
(3) Run the script: **./install-sql-client.sh**.

### Usage Help
![Install SQL Script Usage](https://github.com/markusewalker/Misc-Bash-Scripts/blob/master/install-sql-client/usage.jpg)

### BATS Testing
Along with this script, you can perform unit testing using BATS (Bash Automated Testing System). In order to do this, you will need to ensure BATS is either installed on your system, or you directly invoke the `test.bats` file.

If you choose to install BATS directly on your system, following this documentation: https://bats-core.readthedocs.io/en/stable/installation.html. Once done, you can simply call `bats test.bats` to run the tests. This is further explained below.

In the `install-sql-client` folder, run the following commands:

`git init (May not be needed...)` \
`git submodule add https://github.com/bats-core/bats-core.git test/bats` \
`git submodule add https://github.com/bats-core/bats-support.git test/test_helper/bats-support` \
`git submodule add https://github.com/bats-core/bats-assert.git test/test_helper/bats-assert`

Once done, navigate to the `install-sql-client/src` folder and perform one of the following commands:

`bats test.bats` \
`../test/bats/bin/bats test.bats`

![BATS Testing](https://github.com/markusewalker/Misc-Bash-Scripts/blob/master/install-sql-client/bats.jpg)
