#!/bin/bash

# Authored by   : Markus Walker
# Date Modified : 2/19/22

# Description   : Simple calculator script written in Bash to perform the following operations: addition
#		  subtraction, multiplication and division.

Addition() {
	RESULT=$(echo "$A+$B" | bc -l)
	echo -e "Sum of these two numbers is: ${RESULT}" 
}

Subtraction() {
	RESULT=$(echo "$A-$B" | bc -l)
	echo -e "Difference of these two numbers is: ${RESULT}"
}

Multiplication() {
	RESULT=$(echo "$A*$B" |bc -l)
	echo -e "Product of these two numbers is: ${RESULT}"
}

Division() {
	RESULT=$(echo "$A/$B" | bc -l)
	echo -e "Result of these two numbers is: ${RESULT}"
}

usage() {
	cat << EOF

calculator.sh

Simple calculator written in Bash that will perform the following operations:

	- Addition
	- Subtraction
	- Multiplication
	- Division

This script can be ran interactively, command-line arguments will be a functionality coming later.

USAGE: % ./$(basename "$0") [options]

OPTIONS:
	-h	-> Usage

EXAMPLES:

* Run interactively
	$ ./$(basename "$0")

EOF
}

while getopts "h" opt; do
	case ${opt} in
		h)
			usage
			exit 0;;
		*)
			echo "Invalid option: ${OPTARG}. Valid option(s) are [-h]." 2>&1
			exit 1;;
	esac
done

Main() {
	echo -e "\x1B[96m==========================================="
	echo -e "\tSimple Calculator Tool"
	echo -e "===========================================\x1B[0m\n"

	echo "Welcome to the Simple Calculator Tool! Please find below the supported operations:"
	echo "	1 : Addition"
	echo "	2 : Subtraction"
	echo "	3 : Multiplication"
	echo "	4 : Division"
	echo ""

	# Keep running the program so long as the user inputs yes
	INPUT="yes"
	while [[ $INPUT = "yes" ]]
	do
		# Prompt the user for what operation they wish to do.
		read -p "Enter an operation you want to do: " CHOICE

		# Prompt user to enter in two numbers to complete the mathematical operation.
		read -p "Enter in two numbers: " A B

		# Depending on the user input, navigate to the appropriate operator function.
		case $CHOICE in
			1)
			     Addition
			     echo "";;
			2)
			     Subtraction
			     echo "";;
			3)
			     Multiplication
			     echo "";;
			4)
			     Division
			     echo "";;
			*)
			     echo -e "You must enter a number between 1-4.\n";;
		esac

		read -p "Do you want to continue? Enter 'yes' or 'no': " INPUT

		if [[ $INPUT = "no" ]];
		then
			echo -e "\nThank you for using the Bash Calculator!"

		elif [[ $INPUT = "yes" ]];
		then
			echo ""
			continue
		fi
	done
}

Main "$@"

exit 0
