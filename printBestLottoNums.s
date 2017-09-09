/*
 * Filename: printBestLottoNums.s
 * Author: Daniel Huang
 * Userid: cs30ubp
 * Description: The assembly routine that print out the best winning numbers
 * Date: 07/19/2016
 * Sources of help: None
 */

  .global printBestLottoNums !Delcaresa the symbo to globally 
  			       !visible
  .section ".rodata"	       !the read only data segment
  fmt1:				!formatted string used for printf
  	.asciz "The %d most often picked winning lotto numbers are:\n\t"

  fmt2:
  	.asciz "%d "
  fmt3:
  	.asciz "\n %d was picked %d times"
  fmt4:
  	.asciz "\n"
	.section ".text"	       !The text segment begins here
 
  /*
   * Function name: printBestLottoNums()
   * Function prototype: void printBestLottoNums( const struct lottery 
   *			lotto[], const int howManyToPrint );
   * Description: Print the best winning numbers; user can specify how 
   *		 many numbers to print
   * Parameters:
   *	arg1 - const struct lottery lotto[]- the array of the lottery struct
   *	arg2 -const int howManyToPrint- the number of winning numbers to 
   *					print
   * Side Effects: Print out the winning numbers to stdout
   * Error Conditions: None
   * Return: None
   * Registers Used:
   *  %l0 - how many items to print
   *  %l1 - the first loop counter
   *  %l2 - the traversal ptr
   *  %l3,%l4,%l5,%l6 - for temporary storage use
   *  %o0 - printf's first argument
   *  %01 - printf's second argument
   *  %02 - printf's third argument(depending on the string format
   */

   printBestLottoNums:
   	save	%sp, (-92-8)&-8, %sp
	set	fmt1, %o0	!format string
	mov	%i1, %o1
	call	printf
	nop
	mov	%i0,%l2		!%l2 as the traversal ptr
	mov	%i1,%l0		!store items number to print in %l0
	clr	%l1		!map i to %l1 for the first loop counter
	cmp	%l1, %l0
	bge	end_first_loop
	nop
first_loop:
	set	fmt2, %o0
	ld	[%l2],%l3	!load the lotto number to %l3
	mov	%l3, %o1
	call	printf
	nop
	inc	%l1
	add	%l2,8,%l2	!increment the traversal ptr by 8
	cmp	%l1, %l0
	bl	first_loop
	nop
end_first_loop:	
	clr	%l1		!map i to %l1 for the second lop counter
	cmp	%l1,%l0
	bge	end_loop
	nop
	mov	%i0, %l4	!map the %l4 to be another traversal ptr
second_loop:  			!loop to print the counts of each number
	set	fmt3,%o0
	ld	[%l4], %l5
	mov	%l5, %o1
	add	%l4,4, %l4
	ld	[%l4], %l6
	mov	%l6, %o2
	call	printf
	nop
	inc	%l1
	add	%l4,4,%l4
	cmp	%l1,%l0
	bl	second_loop
	nop
end_loop:
	!print the last new line
	set	fmt4, %O0
	call	printf
	nop
	ret

	restore





