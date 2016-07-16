/*
 * Author: Daniel Huang
 * Userid: cs30ubp
 * Filename: lotto.h
 * Date: July-15-2016
 * Description: Contains functions prototypes/declaration
 */

#ifndef LOTTO_H
#define LOTTO_H

#define EXPECTED_ARGS1 2
#define EXPECTED_ARGS2 3  /*Optional third argument for the X best 
                            winning numbers*/
#define FILE_INDEX 1
#define BEST_NUMBERS_INDEX 2
#define DEFAULT_BEST_NUMBERS 6
#define MAX_LOTTO_NUMBER 53
#define USAGE "Usage: lotto lotto_numbers_file [numbers_to_print]\n"
#define BASE 10


struct lottery {
  unsigned int lottoNumber;
  unsigned int count;

  };

//function prototypes//
void init( struct lottery lotto[],const int numOfElements);

long tokenToLottoNum( const char *token, const int maxLottoNumber);

void updateLottoCount( struct lottery lotto[], const long lottoNumber);

int compareLottoNums( const void *p1, const void *p2);

void printBestLottoNums( const struct lottery lotto[], const int howManyToPrint);

int checkInBounds( long value, long minRange, long maxRange);






#endif /*LOTTO_H*/
