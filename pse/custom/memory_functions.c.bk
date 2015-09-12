#include "memory_functions.h"

double get_mem_delay(double L2_blocks, double RAM_blocks) {
  double L2_delay, RAM_delay;

  L2_delay = L2_blocks * L2_CYCLES_PER_BLOCK;
  RAM_delay = RAM_blocks * RAM_CYCLES_PER_BLOCK;

  return L2_delay + RAM_delay;
}
