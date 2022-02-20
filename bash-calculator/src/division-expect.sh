#!/usr/bin/expect -f

spawn "calculator.sh"

expect "Enter an operation you want to do:\r"
send "4\r"

expect "Enter in two numbers:\r"
send "20 5\r"

expect "Do you want to continue? Enter 'yes' or 'no':\r"
send "no\r"

expect eof
