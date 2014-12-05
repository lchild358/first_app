#!/bin/bash
#
#Display random character at random position with random color
#

#Define array of character for drawing
characters=(a b c d e f g h i j k l m n o p w r s t u v w x y z 0 1 2 3 4 5 6 7 8 9)
colors=(31 32 33 34 35 36 37 39 90 91 92 93 94 95 96 97)
cntc=${#characters[@]} #Number of characters
cntcolor=${#colors[@]} #Number of colors

#Declare variables
rndcidx=0 #random index of character
rndc=0 #random character
rndcolumnidx=0 #random column
rndrowidx=0 #random row
rndcoloridx=0 #random index of color
rndcolor=0
param=

time=0.5
if [ $# -gt 0 ]
then
   time=$1
fi

#Get number of columns and lines of terminal
lines=$(tput lines)
columns=$(tput cols)

#Clear screen
clear
echo -e "\033[0m"

trap 'echo -e "\033[0m"; clear; echo $time; exit' 2

while [ 0 ]
do
    rndcidx=`expr $RANDOM % $cntc` #Generate random character index
    rndc=${characters[$rndcidx]} #Get random character
    rndcolumnidx=`expr $RANDOM % $columns` #Generate random column position
    rndrowidx=`expr $RANDOM % $lines` #Generate random row position
    rndcoloridx=`expr $RANDOM % $cntcolor` #Generate random color index
    rndcolor=${colors[$rndcoloridx]} #Get random color
    param="\033[$rndcolor""m""\033[$rndrowidx;"$rndcolumnidx"f $rndc"
    echo -e $param
    sleep $time
done
exit 0
