#!/usr/bin/expect -f

spawn "./kwanzaa.sh"

expect "Please select an option to choose:\r"
send "1\r"

expect "Do you wish to learn more? Enter 'yes' or 'no':\r"
send "yes\r"

expect "Please select an option to choose:\r"
send "2\r"

expect "Do you wish to learn more? Enter 'yes' or 'no':\r"
send "yes\r"

expect "Please select an option to choose:\r"
send "3\r"

expect "Do you wish to learn more? Enter 'yes' or 'no':\r"
send "yes\r"

expect "Please select an option to choose:\r"
send "4\r"

expect "Do you wish to learn more? Enter 'yes' or 'no':\r"
send "yes\r"

expect "Please select an option to choose:\r"
send "5\r"

expect "Do you wish to learn more? Enter 'yes' or 'no':\r"
send "yes\r"

expect "Please select an option to choose:\r"
send "6\r"

expect "Do you wish to learn more? Enter 'yes' or 'no':\r"
send "yes\r"

expect "Please select an option to choose:\r"
send "7\r"

expect "Do you wish to learn more? Enter 'yes' or 'no':\r"
send "yes\r"

expect "Please select an option to choose:\r"
send "8\r"

expect "Do you wish to learn more? Enter 'yes' or 'no':\r"
send "yes\r"

expect "Please select an option to choose:\r"
send "9\r"

expect "Do you wish to learn more? Enter 'yes' or 'no':\r"
send "yes\r"

expect "Please select an option to choose:\r"
send "10\r"

expect "Do you wish to learn more? Enter 'yes' or 'no':\r"
send "bogus\r"

expect "Please enter 'yes' or 'no':\r"
send "no\r"

expect eof