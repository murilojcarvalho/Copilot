#include <stdint.h>
#include <stdbool.h>
#include <string.h>

#include "blink.h"

static uint8_t led_r_cpy;
static uint8_t led_b_cpy;
static uint8_t led_g_cpy;

bool trigger_red_guard(void) {
  return (led_r_cpy) == (0);
}

bool trigger_bluegreen_guard(void) {
  return ((led_b_cpy) == (0)) && ((led_g_cpy) == (0));
}

void step(void) {
  (led_r_cpy) = (led_r);
  (led_b_cpy) = (led_b);
  (led_g_cpy) = (led_g);
  if ((trigger_red_guard)()) {
    (trigger_red)();
  };
  if ((trigger_bluegreen_guard)()) {
    (trigger_bluegreen)();
  };
}