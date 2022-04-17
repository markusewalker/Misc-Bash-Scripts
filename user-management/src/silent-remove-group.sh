#!/usr/bin/expect -f

spawn "./user-management.sh -f"

expect "Please enter the group you wish to delete:\r"
send "test\r"

expect "Do you want to continue\r"
send "no\r"

expect eof