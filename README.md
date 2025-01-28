I want to show you my game written in RISC-V

This is a minesweeper. 

The rules of the game are identical to the rules of the classic minesweeper game, but there is one exception - according to the my idea, I wanted to make the game more realistic, 
so you can open only one cell with one click, which increases the chance of accidentally bumping into a bomb. In my game, according to the rules, it is allowed to "bump into" bombs, so the game will continue until you clear the entire field yourself, set the flags and hand over the map for verification :)

Launch instructions:
1) You will need to download the attached archive with the game files into one folder, and then open rars1.6 (preferably a new version that fixes bugs with catching exceptions. You can find it here: https://github.com/TheThirdOne/rars/releases/tag/v1.6 You should have java installed on your computer to run this program)
2) open the game file called "main" in the frame itself
3) Connect bitmap display and input/output to the program
4) Set up the bitmap display: set the unit size (the first two lines) to 4 pixels. Make the map size 512 by 512 pixels and select heap as the storage location for the bitmap display (last line)
Then run the program.

Management:
The mouse cursor is not supported by the display, so control takes place using the WASD keys - you can use them to move the cursor - the yellow outlines of the square that will appear after one of the WASD keys is pressed for the first time.
To open (dig up) the cage, press enter
To check the box, press the space bar.
Symbols:
1) A completely filled-in RED cell is a bomb, if you see it, just put a flag on this cell.
2) A fully filled-in BLUE cage is a cage in the radius of which there is guaranteed not a single bomb.
3) The number in the cell shows how many bombs are in the radius of one square next to this cell.
After you have finished filling in the entire map or to exit the game, press ESC, after which two digits will be displayed in the console:
the first digit is the number of bombs that you came across during the game
the second digit is the number of incorrectly placed flags.

The victory conditions are simple:
the first digit must be no more than five.
the second digit must be zero.
By the way, I was lucky to have zero-zero. It took me 20 minutes, so, it is my own record:)
If there are any problems, restart the rars, most often this problem is related to its internal bugs.
