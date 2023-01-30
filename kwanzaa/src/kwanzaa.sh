#!/bin/bash

# Authored By   : Markus Walker
# Date Modified : 1/30/23

# Description   : Inspired by "Practicing Kwanzaa Year Round" by Gwynelle Dismukes.
#                 Simple explanations regarding the Seven Principles and the 
#                 the traditional symbols surrounding Kwanzaa.

choices() {
    echo -e "This script gives the following options. Please find them below:\n"
    echo -e "[1]\tWhat is Kwanzaa?"
    echo -e "[2]\tTraditional Symbols of Kwanzaa"
    echo -e "[3]\tNguzo Saba (Seven Principles)"
    echo -e "[4]\tUmoja (Unity)"
    echo -e "[5]\tKujichagulia (Self-Determination)"
    echo -e "[6]\tUjima (Collective Work & Responsibility)"
    echo -e "[7]\tUjamaa (Cooperative Economics)"
    echo -e "[8]\tNia (Purpose)"
    echo -e "[9]\tKuumba (Creativity)"
    echo -e "[10]\tImani (Faith)\n"
}

kwanzaa() {
    cat << "EOF"

In response to the Watts riots in Los Angeles, Dr. Karenga recognized the need for positive
self-reinforcement of identity and values amongst the Black community in the United States. The
result? Kwanzaa! Founded in 1966, Kwanzaa takes after the phrase "matunda ya kwanza", which 
translates directly to "first fruits" in Swahili.

Based upon the African celebration of harvest, Kwanzaa heavily emphasizes the family as the focal
point. It is structured around the Nguzo Saba (Seven Principles) and last seven days, one for each
principle.

Starting from December 26th to January 1st, Kwanzaa is celebrated in different manners, but
fundamentally it does not change. More is explained in the symbols section, but the following
are the traditional symbols of Kwanzaa.

    - Mkeka
    - Kinara
    - Mishumaa Saba
    - Muhindi
    - Kikombe
    - Mazao
    - Zawadi
    - Karamu

EOF
}

symbols() {
    cat << "EOF"

Kwanzaa contains the following traditional symbols: 
        - Mkeka
        - Kinara
        - Mishumaa Saba
        - Muhindi
        - Kikombe
        - Mazao
        - Zawadi
        - Karamu

The table below gives a brief summary on each of the symbols:

========================================================================================================
Mkeka           | The straw mat. Represents the foundation for the family and community.
Kinara          | The seven-stick candleholder. Represents family background.
Mishumaa Saba   | The seven candles. 3 red, 3 green, 1 black. Represents the Nguzo Saba.
Muhindi         | The ears of corn. Represents the children of the family.
Kikombe         | The unity cup. Represents interdependence.
Mazao           | The basket of fruit. Represents the rewards of labor and blessings of abundance.
Zawadi          | The gifts for the children. Represents recognizition of their labor and contributions.
Karamu          | The communal fest held on the last day of Kwanzaa.
========================================================================================================

EOF
}

nguzoSaba() {
cat << "EOF"

The Nguzo Saba (Seven Principles) is truly the heart of Kwanzaa. During the candle-lighting ceremony each evening,
a candle is lit that discusses one of seven principles. The mishumaa saba (the seven candles) matches the principles
in that there are seven. Three green, three red and one black. The black stands in the center and it represents umoja
(or unity).

The red candles stand left of the umoja candle and the green candles stand to the right of the umoja candle. Each
principle is discussed in greater detail in their respective sections.

EOF
}

umoja() {
    cat << "EOF"

=================================
  _    _                 _       
 | |  | |               (_)      
 | |  | |_ __ ___   ___  _  __ _ 
 | |  | | '_ ` _ \ / _ \| |/ _` |
 | |__| | | | | | | (_) | | (_| |
  \____/|_| |_| |_|\___/| |\__,_|
                       _/ |      
                      |__/                                
=================================

Habari Gani? Umoja/Unity (pronounced oo-MO-jah)! "To strive for and maintain unity in the family, community, nation and race".
This is the first principle of the seven and represents the center black candle in the kinara.            

EOF
}

kujichagulia() {
    cat << "EOF"

=======================================================
  _  __     _ _      _                       _ _       
 | |/ /    (_|_)    | |                     | (_)      
 | ' /_   _ _ _  ___| |__   __ _  __ _ _   _| |_  __ _ 
 |  <| | | | | |/ __| '_ \ / _` |/ _` | | | | | |/ _` |
 | . \ |_| | | | (__| | | | (_| | (_| | |_| | | | (_| |
 |_|\_\__,_| |_|\___|_| |_|\__,_|\__, |\__,_|_|_|\__,_|
          _/ |                    __/ |                
         |__/                    |___/                          
=======================================================

Habari Gani? Kujichagulia/Self-determination (pronounced koo-gee-cha-goo-LEE-yah)! "To define ourselves, name ourselves, create
for ourselves and speak for ourselves". This is the second principle and represents the leftmost rest candle in the kinara.

EOF
}

ujima() {
    cat << "EOF"

==============================
  _    _ _ _                 
 | |  | (_|_)                
 | |  | |_ _ _ __ ___   __ _ 
 | |  | | | | '_ ` _ \ / _` |
 | |__| | | | | | | | | (_| |
  \____/| |_|_| |_| |_|\__,_|
       _/ |                  
      |__/                   
==============================

Habari Gani? Ujima/Collective Work & Responsibility (pronounced oo-GEE-mah)! "To build and maintain our community together and 
make our brother's and sister's problems our problems and to solve them together". This is the third principle and represents the
middle red candle in the kinara.

EOF
}

ujamaa() {
    cat << "EOF"

=======================================
  _    _ _                             
 | |  | (_)                            
 | |  | |_  __ _ _ __ ___   __ _  __ _ 
 | |  | | |/ _` | '_ ` _ \ / _` |/ _` |
 | |__| | | (_| | | | | | | (_| | (_| |
  \____/| |\__,_|_| |_| |_|\__,_|\__,_|
       _/ |                            
      |__/                             
=======================================

Habari Gani? Ujamaa/Cooperative Economics (pronounced oo-JAH-mah)! "To build and maintain our own stores, shops and other businesses
and to profit from them together". This is the fourth principle and represents the last red candle in the kinara, immediate left to
the black umoja candle.

EOF
}

nia() {
    cat << "EOF"

=================
  _   _ _       
 | \ | (_)      
 |  \| |_  __ _ 
 | . ` | |/ _` |
 | |\  | | (_| |
 |_| \_|_|\__,_|
=================             

Habari Gani? Nia/Purpose (pronounced nee-YAH)! "To make our collective vocation the building and developing of our community in order
to restore our people to their traditional greatness". This is the fith principle and represents the first green candle in the kinara,
immediate right to the black umoja candle.

EOF
}

kuumba() {
    cat << "EOF"

========================================
  _  __                     _           
 | |/ /                    | |          
 | ' /_   _ _   _ _ __ ___ | |__   __ _ 
 |  <| | | | | | | '_ ` _ \| '_ \ / _` |
 | . \ |_| | |_| | | | | | | |_) | (_| |
 |_|\_\__,_|\__,_|_| |_| |_|_.__/ \__,_|
========================================                                        

Habari Gani? Kuumba/Creativity (pronounced koo-OOM-bah)! "To do always as much as we can, in the way we can, in order to leave our
community more beautiful and beneficial than we inherited it". This is the sixth principle and represents the second middle green
candle in the kinara.

EOF
}

imani() {
    cat << "EOF"

=================================
  _____                       _ 
 |_   _|                     (_)
   | |  _ __ ___   __ _ _ __  _ 
   | | | '_ ` _ \ / _` | '_ \| |
  _| |_| | | | | | (_| | | | | |
 |_____|_| |_| |_|\__,_|_| |_|_|
=================================                                

Habari Gani? Imani/Faith (pronounced ee-MAH-nee)! "To believe with all our heart in our people, our parents, our teachers, our
leaders and the righteousness and victory of our struggle". This is the seventh and last principle and represents the rightmost
green candle in the kinara.

EOF
}

usage() {
    cat << "EOF"

============================================================================
  _    _                           _  __                                  _ 
 | |  | |                         | |/ /                                 | |
 | |__| | __ _ _ __  _ __  _   _  | ' /_      ____ _ _ __  ______ _  __ _| |
 |  __  |/ _` | '_ \| '_ \| | | | |  <\ \ /\ / / _` | '_ \|_  / _` |/ _` | |
 | |  | | (_| | |_) | |_) | |_| | | . \\ V  V / (_| | | | |/ / (_| | (_| |_|
 |_|  |_|\__,_| .__/| .__/ \__, | |_|\_\\_/\_/ \__,_|_| |_/___\__,_|\__,_(_)
              | |   | |     __/ |                                           
              |_|   |_|    |___/                                            
============================================================================
Kwanzaa was founded in 1966 by Dr. Maulana Karenga as a means to promote positive ethnic values
and identity amongst the Black community in the United States.

This script defines the Nguzo Saba (Seven Priniciples) at a high-level explanation and the
traditional symbols of Kwanzaa. This is an interactive script, so simply run without passing any
flags!

EOF

cat << EOF

Examples of usage:

    $ ./$(basename "$0")
    
EOF
}

while getopts "h" opt; do
        case ${opt} in
            h) 
                usage
                exit 0;;
            *)
                echo "Invalid option. Valid option(s) are [-h]." 2>&1
                exit 1;;
        esac
done

Main() {
    echo -e "\x1B[96m================================================================"
    echo -e "\t\tPracticing Kwanzaa Year Round"
    echo -e "================================================================"
    echo -e "This script will discuss the Nguzo Saba and the traditional symbols of Kwanzaa."
    echo -e "-------------------------------------------------------------------------------\x1B[0m"

    choices

    INPUT="yes"
    while [[ ${INPUT} = "yes" ]]
    do
        read -p "Please select an option to choose: " CHOICE

        case ${CHOICE} in
            1)
                kwanzaa
                ;;
            2)
                symbols
                ;;
            3)
                nguzoSaba
                ;;
            4)
                umoja
                ;;
            5)
                kujichagulia
                ;;
            6)
                ujima
                ;;
            7)
                ujamaa
                ;;
            8)
                nia
                ;;
            9)
                kuumba
                ;;
            10)
                imani
                ;;
            *)
                echo -e "ERROR. You must select a number between 1-10 ONLY."
                ;;
        esac 

        read -p "Do you wish to learn more? Enter 'yes' or 'no': " INPUT

        [[ ${INPUT} = "no" ]] && echo -e "\nHappy Kwanzaa and remember to pratice year-round!\n";

        [[ ${INPUT} = "yes" ]] && choices && continue
        while [[ ${INPUT} != "yes" ]] && [[ ${INPUT} != "no" ]]
		do
			read -p "Please enter 'yes' or 'no': " INPUT
            
			[[ ${INPUT} = "no" ]] && echo -e "\nHappy Kwanzaa and remember to pratice year-round!\n"
			[[ ${INPUT} = "yes" ]] && choices && continue
		done
    done
}

Main "$@"