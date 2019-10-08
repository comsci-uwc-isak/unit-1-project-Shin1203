#!/bin/bash

#reading arguments, making sure there are 4
if [ $# -eq 1 ]; then
	#access maincarfile.txt, delete line that includes argument
	sed -i "/$1/d" car/maincarfile.txt
	rm 
else
	#exit messaage
	echo "please enter liscence plate of car"

fi
