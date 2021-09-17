#include "grains.h"
#include <math.h>

uint64_t square(uint8_t index) {
  if (index < 1 || index > 64) {
    return 0;
  }

  return (uint64_t)pow(2, index-1);
}

uint64_t total(void) {
  uint64_t sum = 0;
  for (int i=1; i < 65; ++i) {
    sum += square(i);
  }
  return sum;
}

