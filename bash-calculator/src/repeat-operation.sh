#!/usr/bin/expect -f

spawn "calculator.sh"

expect "Enter an operation you want to do:\r"
send "1\r"

expect "Enter in two numbers:\r"
send "19 94\r"

expect "Do you want to continue? Enter 'yes' or 'no':\r"
send "yes\r"

expect "Enter an operation you want to do:\r"
send "4\r"

expect "Enter in two numbers:\r"
send "65 7\r"

expect "Do you want to continue? Enter 'yes' or 'no':\r"
send "no\r"

expect eof