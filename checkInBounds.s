/* Filename: checkInBounds.s
 * Author: Daniel Huang
 * Userid: cs30ubp
 * Description: This assembly roution will check if the input arguments are 
 *               in bounds
 * Date: 07/10/2016
 * Sources of help: PIAZZA
 */
 	.global	checkInBounds	!Declares the symbol to be globally visible
				! so that we can call this function from other
				! modules
	.section ".text"	!The text section begins here

/* Function name: checkInBounds()
 * Function prototype: int checkInBounds(long value,long minRange,
 *                                       long maxRange);
 * Description: check if the input value is in bounds, return 1 if so.
 *		Return 0 for false
 * Parameters:
 *		arg1: long value--the input argument
 *		arg2: the minimum value of range(inclusive)
 *		arg3: the maximum value of range(inclusive)
 * Side Effects: None
 * Error Conditions: None
 * Return Value: 1 for true; 0 for false
 *
 * Registers used:
 * 	%i0- arg1 --the input argument value;also return the result 
 * 	%i1- arg2 -- the minimun value
 *	%i2- arg3 -- the maximun value
 */

checkInBounds:	
	save	%sp, -96, %sp	!Save caller's window...magical line	
	cmp	%i0,%i1		!compare the input with min
	bl	outofbounds	!branch if input is smaller than min
	nop
	cmp	%i0,%i2		!compare the input with max
	bg	outofbounds	!branch if input is larger than max
	nop
	ba	inbounds	!jump to the end-of label
	nop
outofbounds:
	mov	0,%i0		!set the return value to 0
	ba end_if
	nop
inbounds:
	mov	1,%i0		!set the return value to 1

end_if:
	ret			!Return to the calling program	
	restore			!Restore caller's window;in "ret" 
				! delay slot
