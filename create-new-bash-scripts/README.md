# Create New Bash Scripts

### Description
Bash script to create new scripts to make them executable upon initial creation.

### Getting Started
To utilize this script, please follow the below workflow:

(1) Clone the script into your environment.\
(2) Make sure the script is executable using the command **"chmod +x new-scripts.sh"**.\
(3) Run the script: **./new-scripts.sh**.

See below an image of **new-scripts.sh** in action:

![Image of New Scripts](https://github.com/markusewalker/Misc-Bash-Scripts/blob/master/create-new-bash-scripts/new-scripts.jpg)

### BATS Testing
Along with this script, you can perform unit testing using BATS (Bash Automated Testing System). In order to do this, you will need to ensure BATS is either installed on your system, or you directly invoke the test.bats file.

If you choose to install BATS directly on your system, following this documentation: https://bats-core.readthedocs.io/en/stable/installation.html. Once done, you can simply call `bats test.bats` to run the tests. This is further explained below.

In the `create-new-bash-scripts` folder, run the following commands:

`git init (May not be needed...)` \
`git submodule add https://github.com/bats-core/bats-core.git test/bats` \
`git submodule add https://github.com/bats-core/bats-support.git test/test_helper/bats-support` \
`git submodule add https://github.com/bats-core/bats-assert.git test/test_helper/bats-assert`

Once done, navigate to the `create-new-bash-scripts/src` folder and perform one of the following commands:

`bats test.bats` \
`../test/bats/bin/bats test.bats`

![BATS Testing Result](https://github.com/markusewalker/Misc-Bash-Scripts/blob/master/create-new-bash-scripts/bats.jpg)
