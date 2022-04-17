#!/usr/bin/expect -f

spawn "./user-management.sh -b"

expect "Enter in the group name you wish to add:\r"
send "test\r"

expect "Do you want to continue\r"
send "no\r"

expect eof