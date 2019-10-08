#!/bin/bash

#reading arguments, making sure there are 4
if [ $# -eq 1 ]; then
	#access maincarfile.txt, delete line that includes argument
	sed -i "/$1/d" ~/Desktop/CarRentalApp/car/maincarfile.txt
	#remove car file 
	rm -r ~/Desktop/CarRentalApp/car/"$1".txt 
else
	#exit messaage
	echo "please enter liscence plate of car"

fi
