#!/usr/bin/expect -f

spawn "./user-management.sh"

expect "Choose an option you want to do:\r"
send "1\r"

expect "Enter in the name of the user to add:\r"
send "test\r"

expect "Will this user require sudo privileges\r"
send "no\r"

expect "New password:\r"
send "test\r"

expect "Retype new password:\r"
send "test\r"

expect "Do you want to continue:\r"
send "no\r"

expect eof