#
# Makefile template for CSE 30 -- PA2
#

#
# You need to change these next three lines for each assignment
#

HEADERS		= lotto.h

C_SRCS		= main.c

ASM_SRCS	= init.s compareLottoNums.s tokenToLottoNum.s \
printBestLottoNums.s\ updateLottoCount.s checkInBounds.s

C_OBJS		= main.o

ASM_OBJS	= init.o compareLottoNums.o tokenToLottoNum.o \
printBestLottoNums.o updateLottoCount.o checkInBounds.o

OBJS		= ${C_OBJS} ${ASM_OBJS}

EXE		= lotto

#
# You should not need to change anything below this line
#

#
# Relevant man pages:
#
# man -M /software/common/gnu/man gcc
# man -M /software/common/gnu/man as
# man -M /opt/SUNWspro/man lint
#

GCC		= /usr/ccs/bin/gcc
ASM		= ${GCC}
LINT		= /software/common/solstudio12/bin/lint

GCC_FLAGS	= -c -g -ansi -std=c99 -Wall -D__EXTENSIONS__
LINT_FLAGS1	= -c -err=warn
LINT_FLAGS2	= -u -err=warn
ASM_FLAGS	= -c -g
LD_FLAGS	= -g -ansi -Wall
#
#
# Standard rules
#

.s.o:
	@echo "Assembling each assembly source file separately ..."
	${ASM} ${ASM_FLAGS} $<
	@echo ""

.c.o:
	@echo "Linting each C source file separately ..."
	${LINT} ${LINT_FLAGS1} $<
	@echo ""
	@echo "Compiling each C source file separately ..."
	${GCC} ${GCC_FLAGS} $<
	@echo ""
#
#
# Simply have our project target be a single default "a.out" executable.
#

${EXE}:	${OBJS}
	@echo "2nd phase lint on all C source files ..."
	${LINT} ${LINT_FLAGS2} *.ln
	@echo ""
	@echo "Linking all object modules ..."
	${GCC} ${LD_FLAGS} -o ${EXE} ${OBJS}
	@echo ""
	@echo "Done."

${C_OBJS}:	${HEADERS}

clean:
	@echo "Cleaning up project directory ..."
	/usr/bin/rm -f *.o ${EXE} a.out *.ln core
	@echo ""
	@echo "Clean."
#
new:
	make clean
	make

