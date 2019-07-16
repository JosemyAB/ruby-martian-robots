# JOSEMYAB Mars Rovers (Ruby Versión)
## My approach to resolve the test.
I have choose create a Rest Service as "Runner" that given the input data runs the logical to create objects, run commands and return the final position of each Rover
In my opinion, the most important classes are "OrientationXXX" (implemented following State Pattern) because it manages the turns and forward movement depending on state of the Rover
I have implement the pattern "Command" for run the commands.

For data treatment i have created a helper module who.
* Validate formatting and content of each line
* Transforms the instructions in objects
The idea is follow the Single responsibility principle.

The error management has been solved returning "falses" for assertions. This point should be improved refactoring to add the standard Rails error handler (unknown to me)

All classes have their corresponding test classes. I have developed the code trying to be faithful to TDD. You can run `$ rails test` over root directory to run all of them

## Main technologies
* Ruby 2.5.5p157
* Rails 5.2.3

## Funcionalities
Move a group of Rovers vehicles along planet plateau according with input data.
Supported movements are:
* Forward
* Turn left
* Turn right

There are four possible orientations:
* N (North)
* S (South)
* E (East)
* W (West)

**If a Rovers goes outside the planet a log message will appear in the console. The other Rovers will continue his movements.**

## Input data format
The input data always has an odd number of lines.
* First line is the dimensions of the planet (x and y axis) separate with white space. For example "10 10"
* Next line is the Rover initial position and orientation in the planet. For example "2 3 N"
* Next line are Rover movements commands. For example: "MMRMRML"

You can add all the necessary Rovers with the previous pair of lines.
All letters must be capital letters.
The input data must be encoded as URI (spaces with %20 and \n with %0A)

Real example with two different Rovers
```
5 5
2 3 N
MMRMRML
1 4 S
MLMM
```

Encoded inputdata for previus example
`5%205%0A2%203%20N%0AMMRMRML%0A1%204%20S%0AMLMM`

## OUTPUT
The output is a line for every Rover that has not left the planet with its final position and orientation.

## RUN APPLICATION
1. Run command $rails server over root directory 
2. Do a http get petition from shell with command `curl -X GET http://localhost:3000/api/v1/marsrovers?inputdata=5%205%0A2%203%20N%0AMMRMRML%0A1%204%20S%0AMLM`
