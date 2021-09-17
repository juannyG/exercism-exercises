#include "hamming.h"
#include <string.h>

int compute(const char *lhs, const char *rhs) {
  int llen = strlen(lhs);
  int rlen = strlen(rhs);
  if (llen != rlen) {
    return -1;
  }

  int distance = 0;
  for(int i=0; i < llen; ++i) {
    if (lhs[i] != rhs[i]) {
      distance++;
    }
  }
  return distance;
}
