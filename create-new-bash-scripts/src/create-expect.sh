#!/usr/bin/expect -f

spawn "./new-scripts.sh"

expect "Enter in a new file name:\r"
send "test\r"

expect eof