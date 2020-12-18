#!/bin/bash

# Authored by   : Markus Walker
# Original Date : 12/15/18
# Date Modified : 1217/20

# Description   : To create new scripts and to make them executable upon creation.

echo -e "\x1B[96m==========================================\n"
echo -e "\tCreate New Scripts Tool\n"
echo -e "==========================================\x1B[0m\n"

read -p "Enter in a new file name: " NAME
touch ${NAME}.sh
echo "#!/bin/bash" >> ${NAME}.sh
chmod +x $NAME.sh
