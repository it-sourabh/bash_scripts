#!/bin/bash
echo $0 #It tells you the name of the bash script
if [[ $1 == "stealth" ]]; then
       echo "This is a stealth scan"
       sudo nmap -Pn -vv -sS -O -p$2 $3
elif [[ $1 == "TCP" ]]; then
       echo "This is a TCP scan"
       nmap -Pn -vv -p$2 $3
else
       echo "Specify"
fi
echo $# #It tells you the total number of positional parameters in the script
