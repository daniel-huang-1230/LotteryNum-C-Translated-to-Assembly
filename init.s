/*
 * Filename: init.s
 * Author: Daniel Huang
 * Userid: cs30ubp
 * Date: 07/16/2016
 * Description: The assembly routine that initialize the array of struct
 * Sources of help: PIAZZA
 */

 .global init		!Declare the symbol to be globally visible
 			! so we can call it from other modules

 .section ".data"	!The data section begins here

 .section ".text" 	!The text segment begins here

 /*
  * Function name: init()
  * Function prototype: void init(struct lottery lotto[], 
  *			const int numOfElements);
  * Description: initialize the array of struct lottery
  * Parameters:
  *	arg1: struct lottery lotto: the array of struct
  *	arg2: const int numOfElements: the number of elements in the array
  * Side Effects: None
  * Error Conditions: None
  * Return Value: void
  * 
  * Registers Used:
  *	 %i0 - arg1 - the struct pointer passed into the function
  *	 %i1 - arg2 - the number of the elements in the array to be initialized
  *	 %l0 - the traversal pointer	
  *	 %l1 - store (size of array)*number of elements
  *	 %l2 - used to store the index/lotto numbers
  */
init:
	save	%sp, -96, %sp	!save caller's window, don't have to save 
				!additional space for array(done in main)
	st	%i0, [%l0]	!the traversal pointer-->%l0
	mov	%i1, %o0	!move the number of elements(53) to %o0
	mov	8, %o1		
	call 	.mul		!call .mul to calculate 8*53=424
	nop
	mov	%o0, %l1	!store 424 to %l1
	st	%g0, [%l0]	!set the lottoNumber in lotto[0] to 0
	st	%g0, [%l0+4]	!set the count in lotto[0] to 0
	add	%l0, 8, %l0	!move to index 1 in the struct array
	cmp	%l0, %l1	! the loop condition
	bg	end_loop	!branch if %l0 is greater than 424
	nop
	set	1, %l2		!use %l2 to store indices/lotto numbers
loop:	/*the loop body*/
	st	%l2, [%l0]	!initialize the lotto number=index
	st	%g0, [%l0+4]	!initialize count=0
	inc	%l2		!index increments by 1
	add	%l0, 8, %l0	!increments the traversal pointer
	cmp	%l0, %l1
	ble	loop
	nop
end_loop:
	ret			!return from the subroutine
	restore			!restore caller's window


