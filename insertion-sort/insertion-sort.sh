#!/bin/bash

# Authored by   : Markus Walker
# Original Date : 3/29/19
# Date Modified : 12/17/20

# Description   : Bash implementation of the Insertion Sort Algortihm.

echo -e "\x1B[96m============================================\n"
echo -e "\tInsertion Sort Algorithm\n"
echo -e "============================================\x1B[0m\n"
echo -e "Welcome to the Bash implementation of the Insertion Sort Algorithm!"

echo -e "\nThis program will sort an array of numbers in increasing and decreasing order.\n"

# Prompt user for the total number and each number to be sorted.
read -p "Please enter the total number of numbers to be sorted: " N
echo "Please enter each number..."

# Read in each value from the user in an array.
for ((i=0;i<N;i++))
do
     read arr[$i]
done

# Perform the insertion sort algorthim.
for ((i=1;i<N;i++))
do
     j=$i-1
     temp=${arr[$i]}

     while((j>=0 && arr[j]>temp))
     do
          arr[$j+1]=${arr[$j]}
          j=$j-1
     done

     arr[j+1]=$temp
done

# Print out the sorted array in increasing order after running the insertion sort algorithm.
echo -e "\nHere are the numbers sorted in increasing order..."

for ((i=0;i<N;i++))
do
     echo ${arr[$i]}
done

# Print out the sorted array in decreasing order after running the insertion sort algorithm.
echo -e "\nHere are the numbers sorted in decreasing order..."

for ((i=N;i>=0;i--))
do
     echo ${arr[$i]}
done

exit 0
