/*
 * Filename: main.c
 * Author: Daniel Huang
 * Userid: cs30ubp
 * Description: The main C code driver for the program
 * Date: 07/16/2016
 * Sources of help : PIAZZA, discussion slides
 */

 #include <stdio.h>
 #include <stdlib.h>
 #include "lotto.h" 
 #include <errno.h> 

 int main(int argc, char *argv[])
{
  /*first check the number of the command line arguments*/

  if(argc != EXPECTED_ARGS1 && argc != EXPECTED_ARGS2) {
 /*if the passed in number of arguments is not valid, print out USAGE info*/
  (void)fprintf(stderr, USAGE);
  return EXIT_FAILURE;

  }
  

/*Open the lotto file with fopen(),and check if the file is opened 
successfully */

FILE *filePtr;

/*print 6 best winning numbers, by default*/
int numbersToPrint=DEFAULT_BEST_NUMBERS;

filePtr=fopen(argv[FILE_INDEX],"r");


if(filePtr == NULL) 
{
  char errStr[BUFSIZ];
  (void)snprintf(errStr, BUFSIZ, "Failed to open lotto numbers file");
  perror(errStr);
  return EXIT_FAILURE;
  }

/*if there is the third optional argument*/
if(argc == EXPECTED_ARGS2) 
{
  errno=0; /*clear the errno first*/
  char *endptr;
  numbersToPrint=strtol(argv[BEST_NUMBERS_INDEX],&endptr,BASE);

/*check for error when the input number is too large for 32-bit long*/
 if(errno !=0) {
  char errStr[BUFSIZ];
  (void)snprintf(errStr, BUFSIZ, TOO_BIG_NUM,argv[BEST_NUMBERS_INDEX],BASE);
  perror(errStr);
  return EXIT_FAILURE;
 }

/*check for error where input is not valid int*/

if(*endptr !='\0')
{
  (void)fprintf(stderr,INVALID_INT,argv[BEST_NUMBERS_INDEX]);
  return EXIT_FAILURE;

  }  

/*check if the input argument is in bounds(1-53) */

if(checkInBounds(numbersToPrint,MIN_LOTTO_NUM,MAX_LOTTO_NUM)!=1)
{ /*print error message and exit if input out of bounds*/
  (void)fprintf(stderr,OUT_OF_BOUNDS,argv[BEST_NUMBERS_INDEX],
                MIN_LOTTO_NUM,MAX_LOTTO_NUM);
  
  return EXIT_FAILURE;

  }
}

/*call init() to initialize the array of struct lottery*/




























  return EXIT_SUCCESS;
}
