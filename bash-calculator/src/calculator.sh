#!/bin/bash

# Authored by   : Markus Walker
# Date Modified : 2/19/22

# Description   : Simple calculator script written in Bash to perform the following operations: addition
#		  subtraction, multiplication and division.

choices() {
	echo -e "1:\tAddition"
	echo -e "2:\tSubtraction"
	echo -e "3:\tMultiplication"
	echo -e "4:\tDivision\n"
}

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

$(basename "$0")

Simple calculator written in Bash that will perform the following operations:

   * Addition
   * Subtraction
   * Multiplication
   * Division

This script is ran interactively.

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
	echo -e "===========================================\x1B[0m"

	echo -e "Welcome to the Simple Calculator Tool! Please find the supported operations below:\n"

	choices

	INPUT="yes"
	while [[ $INPUT = "yes" ]]
	do
		read -p "Enter an operation you want to do: " CHOICE
		read -p "Enter in two numbers: " A B

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

		[[ ${INPUT} = "no" ]] && echo -e "\nThank you for using the Bash Calculator!"
		[[ ${INPUT} = "yes" ]] && choices && continue

		while [[ ${INPUT} != "yes" ]] && [[ ${INPUT} != "no" ]]
		do
			read -p "Please enter 'yes' or 'no': " INPUT
			
			[[ ${INPUT} = "no" ]] && echo -e "\nThank you for using the Bash Calculator!"
			[[ ${INPUT} = "yes" ]] && choices && continue
		done
	done
}

Main "$@"