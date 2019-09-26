#!bin/bash

if [ $# -eq 4 ]; then
	if  [ ! -f "$1.txt" ]; then
		echo "file does not exist"
		exit
	fi
	echo "$1, $2, $3, $4" >> ~/Desktop/CarRentalApp/"$1.txt"
	echo "information stored"


else
	echo "Not enough information"
fi
