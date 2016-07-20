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
 .section ".data"

 MIN_VALUE=1
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
  *  %l0-- errno
  *  %l1 -- the retunrned num
  *  %i0 -arg1- the passed in token
  *  %i1 -the max lotto number
  */


tokenToLottoNum:
	save	%sp, (-92-8)&-8, %sp
	sub	%fp, 4, %l2		!store endptr to %l2
	set	errno, %l0		!set %l0 to be errno
	
	clr	%l0			!clear errno to be zero first
	mov	%i0, %o0		!copy the token to %o0
	mov	%l2, %o1		!put endptr into arguments
	mov	10, %o2			!base 10 copied to %o2
	call	strtol
	nop
	mov	%o0, %l1		!store the returned value to %l1
	ld 	[%l0], %l0		!load errno 
	cmp	0,%l0			!check errno=0
	be	checkendptr
	nop
	mov	-1,%i0			!return -1
	ba 	end
	nop
checkendptr:
	ld	[%l2],%l3		!load the &endptr to %l2
	ldub	[%l3],%l3
	cmp	%l3, %g0		!check if endptr==/0
	be	checkBounds
	nop
	mov	-2,%i0			!return -2 if there is endptr error
	ba	end
	nop
checkBounds:
	mov	%l1, %o0		!put the returned num to %o0
	set	MIN_VALUE,%o1		!copy the min lotto number to %o1
	mov	%i1, %o2		!copy the max lotto number to %o2
	call	checkInBounds
	nop
	cmp	%o0,1			!compare the returned value to 1
	be	validNum
	nop
	mov	-3,%i0
	ba	end
	nop
validNum:
	mov	%l1,%i0		!the num is a valid lotto number,
					!return it 
end:
	ret

	restore
