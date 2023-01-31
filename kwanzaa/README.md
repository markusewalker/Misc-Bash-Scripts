# Practicing Kwanzaa Year-Round

### Description
Bash script that briefly discusses the origins of Kwanzaa, the Nguzo Saba and the traditional symbols associated with Kwanzaa.


### Getting Started
To utilize this script, please perform the following:

1. Clone the script into your environment.
2. Make sure the script is executable using the command `chmod +x kwanzaa.sh`.
3. Run the script: `./kwanzaa.sh`.

### Example
![Kwanzaa Usage](https://github.com/markusewalker/Misc-Bash-Scripts/blob/main/kwanzaa/kwanzaa.jpg)

### BATS Testing
Along with this script, you can perform unit testing using BATS (Bash Automated Testing System). In order to do this, you will need to ensure BATS is either installed on your system, or you directly invoke the `test.bats` file.

If you choose to install BATS directly on your system, following this documentation: https://bats-core.readthedocs.io/en/stable/installation.html. Once done, you can simply call bats `test.bats` to run the tests. This is further explained below.

In the `kwanzaa` folder, run the following commands:

```
git init
git submodule add https://github.com/bats-core/bats-core.git test/bats
git submodule add https://github.com/bats-core/bats-support.git test/test_helper/bats-support
git submodule add https://github.com/bats-core/bats-assert.git test/test_helper/bats-assert
```

Once done, navigate to the `kwanzaa/src` folder and perform one of the following commands:

```
bats test.bats
../test/bats/bin/bats test.bats
```

![BATS Testing](https://github.com/markusewalker/Misc-Bash-Scripts/blob/main/kwanzaa/bats.jpg)
