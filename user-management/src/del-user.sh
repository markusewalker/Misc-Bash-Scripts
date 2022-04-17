#!/usr/bin/expect -f

spawn "./user-management.sh -d"

expect "Choose an option you want to do:\r"
send "2\r"

expect "Enter in the name of the user to delete:\r"
send "test\r"

expect "Do you want to continue\r"
send "no\r"

expect eof