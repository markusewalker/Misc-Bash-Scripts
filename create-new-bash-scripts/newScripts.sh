#!/bin/bash

# Authored by   : Markus Walker
# Original Date : 12/15/18
# Date Modified : 6/18/19

# Description   : To create new scripts and to make them executable upon creation.

echo -e "\e[96m==========================================\n"
echo -e "\tCreate New Scripts Tool\n"
echo -e "==========================================\e[0m\n"

echo "Enter in a new file name"
read NAME
touch $NAME.sh
echo "#!/bin/bash" >> $NAME.sh
chmod +x $NAME.sh
