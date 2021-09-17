#include "resistor_color.h"

resistor_band_t COLOR_MAP[] = {BLACK, BROWN, RED, ORANGE, YELLOW, GREEN, BLUE, VIOLET, GREY, WHITE};

resistor_band_t *colors(void) {
  return COLOR_MAP;
}

int color_code(int code) {
  return COLOR_MAP[code];
}
