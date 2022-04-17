#!/usr/bin/expect -f

spawn "./user-management.sh"

expect "Choose an option you want to do:\r"
send "3\r"

expect "Enter in the group name you wish to add:\r"
send "test\r"

expect "Do you want to continue\r"
send "no\r"

expect eof