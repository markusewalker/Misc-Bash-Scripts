#!/usr/bin/expect -f

spawn "calculator.sh"

expect "Enter an operation you want to do:\r"
send "3\r"

expect "Enter in two numbers:\r"
send "10 10\r"

expect "Do you want to continue? Enter 'yes' or 'no':\r"
send "no\r"

expect eof
