p=0
o=0
ip -s -s neigh flush all &> /dev/null
echo "This script can only be used for the /24 subnet"
until ((false)); do
	if [[ p -gt 3 ]]; then
	echo "Error: Too many wrong inputs"
        exit
        fi
	read -p "Enter the first octet: " q
	read -p "Enter the second octet: " w
	read -p "Enter the third octet: " e
	if [[ q -eq 0 || q -gt 255 || w -gt 255 || e -gt 255 ]]; then
	((p=p+1))
	if ((p<=3)); then
	echo "Invalid IP address, try again"
	fi
        continue
	fi
	break
	done
echo "Now specify the range:"
while [[ true ]]; do
	if [[ o -gt 3 ]]; then
	echo "Error: Too many wrong inputs"
	exit
	fi 
	read -p "$q.$w.$e." a
	read -p "$q.$w.$e." b
	if [[ a -eq 0 || b -eq 0 || a -gt 255 || b -gt 255 || a -gt b ]]; then
	((o=o+1))
	if ((o<=3)); then
        echo "Invalid Range, try again"
	fi
        continue
	fi
	break
	done
for ((i=$a;i<=$b;i++))
	do
        ping -c 3 $q.$w.$e.$i &> /dev/null &
	done
for ((j=7;j>=0;j--))
	do
        	sleep 1  #This command delays the result for the specified ammount of time
		echo "Results in $j"
	done

echo "Here are all the mac addresses of your network:"
arp -na | cut -d " " -f 2,4 | grep -v "incomplete" | sort -n  #This command cuts and prints only the specified fields in the standard output

#This command is used to filter the output and not show the line containing the specified string




































































