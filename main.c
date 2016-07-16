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
  
  }  

































  return EXIT_SUCCESS;
}
