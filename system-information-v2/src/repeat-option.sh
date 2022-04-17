#!/usr/bin/expect -f

spawn "./sys-info-v2.sh"

expect "Please enter which option you would like to use:\r"
send "1\r"

expect "Do you want to continue? Enter 'yes' or 'no':\r"
send "yes\r"

expect "Please enter which option you would like to use:\r"
send "2\r"

expect "Do you want to continue? Enter 'yes' or 'no':\r"
send "no\r"

expect eof