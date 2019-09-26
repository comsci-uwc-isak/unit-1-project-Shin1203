#!/bin/bash


cd ~/Desktop/CarRentalApp/car
#lists all file names before
echo "you have " * " in current folder"
echo " "

#this loop will print filename and below that contents.
for f in *.txt; do
echo "filename-" $f
cat $f
done
