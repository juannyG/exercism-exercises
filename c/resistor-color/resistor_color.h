#ifndef RESISTOR_COLOR_H
#define RESISTOR_COLOR_H

typedef enum {
              BLACK,
              BROWN,
              RED,
              ORANGE,
              YELLOW,
              GREEN,
              BLUE,
              VIOLET,
              GREY,
              WHITE
} resistor_band_t;

resistor_band_t *colors(void);
int color_code(int);

#endif
