#!/bin/bash

# Authored by   : Markus Walker
# Date Modified : 2/21/22

# Description   : To create new scripts and to make them executable upon creation.

INTERACTIVE=true
NAME=""

createScript() {
    touch ${NAME}.sh
    echo "#!/bin/bash" >> ${NAME}.sh
    chmod +x $NAME.sh

    echo -e "\nVerifying new script exists in this directory..."
    ls -lart
    echo ""
}

usage() {
	cat << EOF

new-scripts.sh

Script that will create new Bash scripts based on the name you give it. That's it. That's
the script. You can run this interactively or silently.

USAGE: % ./$(basename "$0") [options]

OPTIONS:
    -h		-> Usage
    -n          -> Specify name of script you wish to create

EXAMPLES:

* Run script interactively

    % ./$(basename "$0")

* Run script silently

    % ./$(basename "$0")

EOF
}

while getopts "hn:" opt; do
	case ${opt} in
		h)
			usage
            exit 0;;
        n)
            INTERACTIVE=false
            NAME=$OPTARG
            ;;
		*)
			echo "Invalid option. Valid option(s) are [-h, -n]." 2>&1
			exit 1;;
	esac
done


Main() {
    if [[ ${INTERACTIVE} = true ]]; then
        echo -e "\x1B[96m===================================="
        echo -e "\tCreate New Scripts"
        echo -e "====================================\x1B[0m\n"

        read -p "Enter in a new file name: " NAME
        createScript
    else
        createScript
    fi
}

Main "$@"

exit 0