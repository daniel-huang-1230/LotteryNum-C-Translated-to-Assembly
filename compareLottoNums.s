/*
 * Filename: compareLottoNums.s
 * Author: Daniel Huang
 * Userid: cs30ubp
 * Description: This assembly routine would compare two lottery number 
 *		according to its count
 * Date: 07/19/2016
 * Sources of help: none
 */


  .global	compareLottoNums	!Declare the symbol to be globally
  					!visible

 .section ".text"



 /* 
  * Function name: compareLottoNums()
  * Function prototype: int compareLottoNums( const void *p1, const void *p2 );
  * Description: it compares two structs' count number and return 
  *		differently 
  * Paramenters:
  *	arg1- const void *p1- a pointer to the first struct
  *	arg2- const void *p2- a pointer to the second struct
  * Side Effects: None
  * Error Condtions: None
  * Return: 1 if p1 < p2 
  *	    -1 if p1 > p2
  * Registers Used:
  *  %i0- arg1 above&the return value
  *  %i1- arg2 above
  *  %l0- store the count of p1
  *  %l1- store the count of p2
  */


  compareLottoNums:
  	save	%sp, -96, %sp
	add	%i0,4, %l0	!traverse to count member
	ld	[%l0], %l0	!load the count of p1 to %l0
	add	%i1,4, %l1
	ld	[%l1], %l1	!load the count of p2 to %l1
	cmp	%l0, %l1	!compare the counts
	be	compareNum	!branch if counts are equal
	nop
	cmp	%l0, %l1
	bg	returnneg1
	nop
	
	mov	1,%i0		!return 1
	ba	end_if
	nop
compareNum:
	ld	[%i0],%l2
	ld	[%i1],%l3
	cmp	%l2,%l3
	bl	returnneg1
	nop
	mov	1,%i0		!return 1
	ba	end_if
	nop
returnneg1:
	mov	-1,%i0		!return -1

end_if:
	ret
	restore











	
