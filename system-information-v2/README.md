# System Information v2

### Description
Bash script to get system information of your Linux distro. This is modified from the original `sys-info.sh` to include both interactive and silent options.

### Getting Started
To utilize this script, please follow the below workflow:

1. Clone the script into your environment.
2. Make sure the script is executable using the command `chmod +x sys-info-v2.sh`.
3. Run the script: `./sys-info-v2.sh`.

See below an image of the script in action:

![Image of System information](https://github.com/markusewalker/Misc-Bash-Scripts/blob/main/system-information-v2/sys-info-v2.jpg)

### BATS Testing
Along with this script, you can perform unit testing using BATS (Bash Automated Testing System). In order to do this, you will need to ensure BATS is either installed on your system, or you directly invoke the test.bats file.

If you choose to install BATS directly on your system, following this documentation: https://bats-core.readthedocs.io/en/stable/installation.html. Once done, you can simply call `bats test.bats` to run the tests. This is further explained below.

In the `system-information-v2` folder, run the following commands:

```
git init
git submodule add https://github.com/bats-core/bats-core.git test/bats
git submodule add https://github.com/bats-core/bats-support.git test/test_helper/bats-support
git submodule add https://github.com/bats-core/bats-assert.git test/test_helper/bats-assert
```

Once done, navigate to the `system-information-v2/src` folder and perform one of the following commands:

```
sudo bats test.bats
sudo ../test/bats/bin/bats test.bats
```

![BATS Testing Result](https://github.com/markusewalker/Misc-Bash-Scripts/blob/main/system-information-v2/bats.jpg)
