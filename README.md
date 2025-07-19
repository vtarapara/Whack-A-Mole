# Whack-A-Mole
ECE350 Final Project
### Group Members
- Aaron Hsu
- Vivek Tarapara
### Description
We plan to use our processor to recreate the Whack-A-Mole arcade game. Our game will interface with a variety of hardware peripherals such as pressure sensors, LED diodes, 7-segment displays, and audio devices.

### MVP
A working Whack-A-Mole game that is able to initiate “moles” indicated by LEDs, detect “hits” via pressure sensors, and properly record and display scores through the 7-segment display.

### Bonus Features
- LEDs animations that react based on mole hit
- Audio effects to accompany gameplay
- Difficulty levels/speeds based on current score or hit/miss ratio
- Storing of high scores
- Generating pseudo-random numbers instead of hard-coding mole timing (implemented via hardware device)

### Computational Challenges
- Interfacing with different peripherals
- Having responsive gameplay (cleaning garbage readings from sensors + accurately and efficiently detecting hits)
- Maintaining a scoring system that holds state (for high score)
- Concurrent processing (many tasks will have to be done simultaneously: “mole” popping, hit detection, score calculation, display updates, etc., so ensuring that the game responds without noticeable delay to player actions may present an organizational challenge)
- Generating pseudo-random numbers via hardware for mole timing
- Implementing bonus effects (audio + visual), especially if we animate effects using LEDs

### Hardware Needed
- Nexus A7 FPGA
- 7-segment display
- Pressure sensors
- Variety of single color LED diodes (25+)
- Speaker
  
### Schedule
#### System Design (by March 27th)
1. Defining the inputs and outputs + determining how to interface with them.
2. Describe the computation demands of the game.
3. Designing the processor extension to support custom instructions
4. Packaging and aesthetics considerations (3D printed parts, casing, LEDs placement, etc).

#### Building the MVP (by April 10th)
1. Physical assembly of the system.
2. Code development for the basic game mechanism on the processor.
3. Configure and test the processor extensions.
4. Integrate and test the input (pressure sensors) and output devices (LEDs, 7 segment display).

#### Enhancements (by April 20th)
1. Developing a high score system and displaying it on the 7-segment display.
2. Implementing audio features (game sounds, hit sounds, etc).
3. Adding game difficulty options.
4. Generating pseudo-random numbers for mole spawn using built-in clock cycle.
5. Refining and improving the visual appeal.
