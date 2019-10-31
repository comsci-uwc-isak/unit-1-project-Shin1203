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

### Uninstall.sh code

```

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
