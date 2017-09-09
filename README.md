# Project Overview

 This project is a personal programming assignment from the course **Computer Organization and System Programming"" at 
 **UC San Diego**. The goal of the course overall is to help us learn the basics of **x86 assembly** and along with some **C** 
 programming. The C program itself is very straightforward and self-explanatory, but the real challenge lies in where we, as students, had
 to translate the program from **C** to **assembly**. Today, assembly language is used primarily for direct hardware manipulation,
 access to specialized processor instructions, or to address critical performance issues. Typical uses are **device drivers**, 
 **low-level embedded systems**, and **real-time systems**.
 
 
 # Language
  This program consists of both **C** and **assembly** language




# Date: 07/19/2016


1. This program would process a file containing a lot of lotto winning numbers as well
as some random invalid numbers/symbols. And the program would be able to pick
and sort the numbers that win the most and print out the top X winning number depending 
on user's choice from the command line.
2. With the supplied **Makefile** from the public directory, just type in "make" in command line.

3. Assuming your are in the correct directory with all source files in it, type:
./lotto [filenameofLottoNumbers] [optional X best winning numbers]

for example:

./lotto lotto.numbers 7 

would print out the top 7 winning lottery numbers 

4.10

"45g54" is not an integer
Skipping it ...

Converting "999999999999999999999" base "10": Result too large

Skipping bad entry -4 ... Not in range [1-53]

Skipping bad entry 55 ... Not in range [1-53]

The 10 most often picked winning lotto numbers are:

26 31 28 46 15 20 33 11 12 35 

26 was picked 192 times
31 was picked 191 times
28 was picked 187 times
46 was picked 186 times
15 was picked 185 times
20 was picked 184 times
33 was picked 181 times
11 was picked 179 times
12 was picked 179 times
35 was picked 179 times

5.[cs30ubp@ieng9]:~$ ./lotto lotto.numbers 58
numbers_to_print (58) must be in range of [1 - 53]



6. 

I have to test number such as gg for the third command line arguments.

And also test for invalid/non-existent file name, which will just print out the USAGE
info.

For the number converting, I do know that my program doesn't not handle the errno!=0
case. So, numbers such as 9999999999999999999999999999999 would fall into the out of bounds
error case instead of the errno converting error message.


7.
If you ommit the third command line argument, the program would by default print out the 
top 6 best winning lottery numbers.



# Author 
[@Daniel](https://www.linkedin.com/in/daniel-huang-443546115/)
