#include <string.h>

#include "rns.h"
#include "routing.h"

/*
 * notice that the the processing queue is mirror of the coremask
 * TODO: clear these functions
 */
#define CHECK_COREMASK(coremask, position) ( ((1ULL << 31) >> position) & (coremask) )

/*
 * CUSTOM_select expects that the clients are sorted in the priority order.
 */
uint64_t CUSTOM_select(RNS_Resource *r, uint64_t release_index) {
  printf("test select");
  return 0;
}

uint64_t CUSTOM_reserve(RNS_Resource *r, uint64_t pc, RNS_Client **queue,
                        uint64_t *position, RNS_Queue_Attribute *new_attrs) {
  printf("test reserve");
  return 0;
}
