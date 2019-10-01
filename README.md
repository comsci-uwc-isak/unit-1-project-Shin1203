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
** Defining the problem (topic 1.1.1) **
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
5. Trips can be recorded and stored for an existing car
6. A basic database system is implemented
7. A basic backup functionality


### Proposed solution
I decided on choosing bash as the best program for the solution. This is because the user doesn't want a complicated system, and wants a terminal based program. The use of a computer program to store data will make the data more accessible, safe and easy to input in comparison to the old hand-written system. Some problems with the program is that it is very simple, and the user interface may be confusing due to it being in the terminal, as well as some limitations in functionality. I believe still that a bash program is the best solution, as it provides a simple solution that should not be too complicated to use.

Create a car
"$create plate model color pseats"
-Get inputs with argument
-Check number of arguments, if 4 then continue, if not exit "message"
`if [ $# -eq 4 ]`
-write to mainfile with one extra line, not erasing other entries
-create car trip file with license plate.txt

Record
-Check arguments (plate, km , dateout, date in)
-Check that the car exists
-If the car exists, writ ethe trip info in the $plate.txt file, without erasing previous trips.

Summary
-Check the car file for all files
-Print out the name of each file, 
-Under the name of each file, print out the contents of the file

-------------


Design
---------
###First sketch diagram of system
![FirstDiagram](Diagram.png)


Development
--------
###First install program
```sh
#!/bin/bash
#minimal Car rental app

echo "Starting the installation"

#moving to the desired location
cd ~/Desktop
echo "moving to desktop"
echo $PWD

#Check for correct change directory

#Create App folder
mkdir RentalCarApp
cd RentalCarApp
#Creatae folder for database, and script
mkdir db
mkdir scripts
echo "Structure created successfully"


#uninstall option

echo "Would you like to keep program?"
echo "Y for yes, N for no."
read choice

if [ $choice == "Y" ]; then
	echo "Program is installed."
fi

if [ $choice == "N" ]; then
	echo "Deleting program"
	cd ~/Desktop
	rm -r RentalCarApp
fi
```

Evaluation
-----------



