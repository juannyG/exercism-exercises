#include "armstrong_numbers.h"


bool is_armstrong_number(int candidate) {
  int candidate_len = 0, temp = candidate;
  // Find the lenght to determine the power
  while (temp != 0) {
    candidate_len++;
    temp /= 10;
  }

  int i;
  int sum = 0, base = 0, pow = 0;
  temp = candidate;
  while (temp != 0) {
    pow = 1;
    base = temp % 10;
    for (i=0; i < candidate_len; ++i) {
      pow *= base;
    }
    sum += pow;
    temp /= 10;
  }
  return sum == candidate;
}
