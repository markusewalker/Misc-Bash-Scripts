#!/usr/bin/expect -f

spawn "./kwanzaa.sh"

expect "Please select an option to choose:\r"
send "10\r"

expect "Do you wish to learn more? Enter 'yes' or 'no':\r"
send "no\r"

expect eof