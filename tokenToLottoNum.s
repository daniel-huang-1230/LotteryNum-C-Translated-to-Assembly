/* 
 * Filename: tokenToLottoNum
 * Author: Daniel Huang
 * Userid: cs30ubp
 * Description: convert the tokens to lotto numbers
 * Date: 07/19/2016
 * Sources of help: PIAZZA
 */

 .global	tokenToLottoNum		!declares the symbol to be globally
 					!visible

 .section ".text"			!text segment begins here

 /*
  * Function name: tokenToLottoNum()
  * Function prototype: long tokenToLottoNums( const char *token, 
  *			const int maxLottoNumber );
  * Description: convert the tokens to num and handle all error cases
  * Parameters:
  *	arg1- const char *token- the passed in token
  *	arg2- const int maxLottoNumber- the max lotto number, 53 in this program
  * Side Effects: none
  * Error Conditions: none
  * Return: 1 if the token is a valid lotto number, -1 if errno!=0; -2 if 
  *	    endptr error happens; -3 if the number is not in bounds
  * Registers Used:
  *
  * TODO
  */


tokenToLottoNum:
	save	%sp, (92-8)&-8, %sp
	sub	%fp, 4, %o1		!store endptr to %o1
	mov	%i0, %o0		!copy the token to %o0
	mov	10, %o2			!base 10 copied to %o2
	call	strtol
	nop



	ret
	restore
