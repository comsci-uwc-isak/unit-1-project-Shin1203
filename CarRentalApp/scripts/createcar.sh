#!/bin/bash

#reading arguments, making sure there are 4
if [ $# -eq 4 ]; then
	#access car storage, make txt file with info
	echo "$1 $2 $3 $4" >> ~/Desktop/CarRentalApp/db/maincarfile.txt
	echo " " > ~/Desktop/CarRentalApp/db/"$1.txt"
	bash ~/Desktop/CarRentalApp/scripts/frame "Car created successfully"
else
	#exit messaage
	echo "not enough info, exiting"

fi
