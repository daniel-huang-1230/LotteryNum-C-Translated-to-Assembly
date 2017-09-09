/*
 * Filename: updateLottoCount.s
 * Author: Daniel Huang
 * Userid: cs30ubp
 * Description: the assembly routine that increments the count of winning 
 *		lotto numbers
 * Date: 07/19/2016
 * Sources of help: PIAZZA
 */




.global	updateLottoCount	!declares the symbol to be globally visible


.section ".text"		!the text segment begins here



/*
 * Function name: updateLottoCount()
 * Function prototype: void updateLottoCount( struct lottery lotto[],
 *			const long lottoNumber );
 * Description: increases the count of lotto numbers
 * Parameters:
 *	arg1 - the array of the lottery struct
 *	arg2 - the winning number
 * Side Effects: None
 * Return: None
 * Registers Used:
 *	%i0 - the arg1 above
 *	%i1 - the arg2 above
 *      %o0 - the size of struct
 *	%l0 - the offset
 *	%l1 - the traversal ptr
 *	%l2 - store the count value
 */






updateLottoCount:
	save	%sp, -96, %sp
	mov	8, %o0		!copy the size of struct to %o0
	mov	%i1,%o1		!copy the lotto num to %o1
	call	.mul
	nop
	mov	%o0,%l0		!store the offset in %l0
	mov	%i0, %l1	!make %l1 the traversal ptr
	add	%l1,%l0,%l1
	add	4,%l1, %l1	!offset to count member
	ld	[%l1], %l2
	inc	%l2		!increments the count by 1
	st	%l2,[%l1]	!store the incremented count back
	ret 
	restore
