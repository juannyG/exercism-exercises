#include "isogram.h"
#include <string.h>
#include <ctype.h>
#include <stdio.h>


bool is_isogram(const char phrase[]){
  // null type check
  if (!phrase) {
    return false;
  }

  // recast to lowercase
  char copy[strlen(phrase)];
  for (size_t i=0; i < strlen(phrase); ++i) {
    copy[i] = tolower(phrase[i]);
  }

  for (size_t i=0; i < strlen(phrase); ++i) {
    if (isalpha(copy[i])) {
      for (size_t j=i+1; j < strlen(phrase); ++j){
        if (copy[i] == copy[j]) {
          return false;
        }
      }
    }
  }
  return true;
}
