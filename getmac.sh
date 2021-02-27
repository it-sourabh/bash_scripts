echo "This script can only be used for the /24 subnet"
until ((false)) 
        do
	read -p "Enter the first octet: " q
	read -p "Enter the secon octet: " w
	read -p "Enter the third octet: " e
	if [[ q -eq 0 || q -gt 255 ]]; then
	echo "Invalid IP address, try again"
        continue
	fi
	break
	done
echo "Now specify the range:"
while [[ true ]]; do 
	read -p "$q.$w.$e." a
	read -p "$q.$w.$e." b
	if [[ a -eq 0 || b -eq 0 || a -gt 255 || b -gt 255 || a -gt b ]]; then
        echo "Invalid Range, try again"
        continue
	fi
	break
	done
for ((i=$a;i<=$b;i++))
	do
        ping -c 1 $q.$w.$e.$i &> /dev/null &
	done
for ((j=5;j>=0;j--))
	do
        	sleep 1  #This command delays the result for the specified ammount of time
		echo "Results in $j"
	done

touch .macoutput.txt 
arp -na | cut -d " " -f 2,4 > .macoutput.txt  #This command cuts and prints only the specified fields in the standard output

echo "Here are all the mac addresses of your network:"

grep -v "incomplete" .macoutput.txt | sort -n #This command is used to filter the output and not show the line containing the  
                                                                  #specified string




































































