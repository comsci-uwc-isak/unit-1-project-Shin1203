![CarRental](logo.png)

Car Rental Minimal App
===========================

A car rental management minimal app in Bash.

Contents
-----
  1. [Planning](#planning)
  1. [Design](#design)
  1. [Development](#development)
  1. [Evalution](#evaluation)

Planning
----------
** Defining the problem (topic 1.1.1)
100-150 words explaining context of problem
A system change has to happen from handwritten records to a computer system that keeps track of car rentals
Potential problem with old system- handwritten
data loss might happen when people lose papers, access is hard because its on paper, hard to read handwriting, damage to records. takes more work to write down all the info about cars
Benefits of new system- easy to use, all info stored in one area, easy access as well as quick data entering.
Requirements requested of program
-Should be a simple terminal based program
-easy installation, as well as transparency of steps
-allow user to create new car, record trips, query trips and edit delete car information.
-Enter trip distance for car
-permanent storage system
-comandd to see total statistics
-User skill independant
-Data should be safely backed up, all trip data should go under specific car

### Success Criteria
These are the measurable outcomes
1. A car can be created and stored in database
2. A car's information can be edited
3. A car can be deleted from the database
4. The installation is ***Simple=> one step process***
5. The uninstallation is also ***Simple
6. Trips can be recorded and stored for an existing car
7. A basic database system is implemented
8. A basic backup functionality

### Proposed solution
I decided on choosing bash as the best program for the solution. This is because the user doesn't want a complicated system, and wants a terminal based program. The use of a computer program to store data will make the data more accessible, safe and easy to input in comparison to the old hand-written system. Some problems with the program is that it is very simple, and the user interface may be confusing due to it being in the terminal, as well as some limitations in functionality. I believe still that a bash program is the best solution, as it provides a simple solution that should not be too complicated to use.

### Create a car
"$create plate model color pseats"
-Get inputs with argument
-Check number of arguments, if 4 then continue, if not exit "message"
`if [ $# -eq 4 ]`
-write to mainfile with one extra line, not erasing other entries
-create car trip file with license plate.txt

### Record
-Check arguments (plate, km , dateout, date in)
-Check that the car exists
-If the car exists, writ ethe trip info in the $plate.txt file, without erasing previous trips.

### Summary
-Check the car file for all files --- 
-Print out the name of each file, ---
-Under the name of each file, print out the contents of the file --- cat,

### Install
-Use mkdir to make "CarRentalApp"
-Go into USB with the "CarRentalApp"
-Use "cp" command to copy contents of CarRentalApp (db, scripts, tests)
-cp copies all folders to the "CarRentalApp" in desktop
-Install complete, alert user



-------------


Design
---------
###First sketch diagram of system
![FirstDiagram](Diagram.png)


Development
--------
### Install.sh code
```sh
#!/bin/bash

#This file copies the car rental app from a usb to desktop
#make directory CarRentalApp

mkdir ~/Desktop/CarRentalApp
echo "Making folder as *CarRentalApp*-desktop"

#Copy CarRentalApp conttents from usb to Desktop
cp -r ../ ~/Desktop/CarRentalApp
echo "copying files to folder"
echo "Installation complete"
```

### uninstall.sh code
```
#!/bin/bash
#uninstall option

echo "Would you like to uninstall the app?"
echo "Y for yes, N for no."
read choice

if [ $choice == "N" ]; then
        echo "Canceling uninstall"
fi

if [ $choice == "Y" ]; then
        echo "Deleting program"
        cd ~/Desktop
        rm -r CarRentalApp
fi
```

### create.sh code
```
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
```

### deletecar.sh code
```
#!/bin/bash
#reading arguments, making sure there are 4
if [ $# -eq 1 ]; then
        #access maincarfile.txt, delete line that includes argument
        sed -i "/$1/d" ~/Desktop/CarRentalApp/db/maincarfile.txt
        #remove car file
        rm -r ~/Desktop/CarRentalApp/db/"$1".txt
        "Deletedd succesfully"
else
        #exit messaage
        echo "please enter liscence plate of car"
fi
```
    
### edit.sh code
```
#!/bin/bash
#This program edit the information of an exiting car in the
#maincarfile
#user enters [license place] [model] [red] [pp]

if [ $# -ne 4 ]; then
  echo "Error with the number of arguments"
  echo "Enter License Maker Model Passengers"
  exit
fi

license=$1
maker=$2
model=$3
pp=$4

cd ../db

if [ ! -f "$license.txt" ]; then
  echo "File not found!"
fi

#find the line with the given car plate and delete it
sed -i '' "/^$license/d" maincarfile.txt
#add the new information
echo "$license $maker $model $pp" >> maincarfile.txt
cd ../scripts
bash frame "Car edited successfully"    
``` 
    
### summary.sh code    
```    
#!/bin/bash

cd ~/Desktop/CarRentalApp/db
#lists all file names before
echo "you have " * " in current folder"
echo " "

#this loop will print filename and below that contents.
for f in *.txt; do
echo "filename-" $f
cat $f
done

```
### record.sh code

```
 #!bin/bash
cd ~/Desktop/CarRentalApp/db

#Checks for 4 arguments, then if file exists or not
if [ $# -eq 4 ]; then
        if  [ ! -f "$1.txt" ]; then
                echo "file does not exist"
                exit
        fi
        #adds arguments as info into specified folder(found by license plate)
        echo "$1, $2, $3, $4" >> ~/Desktop/CarRentalApp/db/"$1.txt"
        echo "information stored"


else
        echo "Not enough information"
fi
```   
### frame code (Used as "image" for messages)
```
  GNU nano 4.3                               frame
#!/bin/bash

echo "enter"

#this code reads argument, which is bash frame *argument
word=$1


for (( i=0; i<100; i++ ))
do
echo -n "*"
done
echo " "



echo -n "*"

# first line, straight line

for (( i=1; i<99; i++ ))
do
        echo -n " "
done
echo -n "*"
echo " "

len=${#word}
(( spacing=(100-$len)/2 ))

echo -n "*"
for (( i=1; i<$spacing; i++))
do
        echo -n " "
done
echo -n $word



#to create equal spacing between message, variable spsacing is used, which subtracts total >
#To combat unequal space with odd numbers (no decimals in bash), we define oddd numbers wit>
for (( i=( 100-$spacing ); i<99; i++))
do
        echo -n " "
done

(( odd=($spacing+$spacing+$len) ))
if [ $odd -eq 99 ]; then
echo -n " "
fi
echo -n "*"


echo " "
echo -n "*"
for (( i=1; i<99; i++ ))
do
        echo -n " "

```   
Evaluation
-----------

Test 1;
First run of the program we hadd one issue: the test file needed to move to the main folder
``` .sh
cd../
```
This is necessaary becaus ethe `creeate.sh` resides in the main folder wheras the test filee is inside the /tests folders.

To check that the car was created in the main file (maincarfile.txt), the folllowing command is used `LastLine=$( tail -n 1 ../car/maincarfile.txt)`.

**Summary:**
What type of testing did we do today?
We did dydnamic testing, running testCreate to sese if the create command works
It was Alpha testing, as we the developers tested the software, not an end-game user.
It is also white-box testing, as we know the inside of the code and how everything works.
