#!/usr/bin/expect -f

spawn "./backup-system.sh"

expect "Please enter in the directories that you wish to backup:\r"
send "/home/markus/Pictures\r"

expect "Please enter folder location the backup will be staged:\r"
send "/home/markus/backups\r"

expect eof