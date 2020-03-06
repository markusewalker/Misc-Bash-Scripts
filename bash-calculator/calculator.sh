#!/bin/bash

# Authored by   : Markus Walker
# Original Date : 3/18/19
# Date Modified : 6/18/19

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

echo -e "\e[96m==========================================="
echo -e "\tSimple Calculator Tool"
echo -e "===========================================\e[0m\n"

echo "Welcome to the Simple Calculator Tool! Please find below the supported operations:"
echo "	1 : Addition"
echo "	2 : Subtraction"
echo "	3 : Multiplication"
echo -e "	4 : Division\n"

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

	echo "Do you want to continue? Enter 'yes' or 'no'."
	read INPUT

	if [[ $INPUT = "no" ]];
	then
		echo -e "\nThank you for using the Simple Calculator Tool!\n"

	elif [[ $INPUT = "yes" ]];
	then
		echo ""
		continue
	fi
done

exit 0
