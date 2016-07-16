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

  if(argc != EXPECTED_ARGS && argc !=0) {
 /*if the passed in number of arguments is not valid, print out USAGE info*/
  (void)fprintf(stderr, USAGE);
  return EXIT_FAILURE;

  }
  








































  return EXIT_SUCCESS;
}
