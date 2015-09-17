#include <string.h>

#include "rns.h"
#include "sso_scheduler.h"

/*
 * notice that the the processing queue is mirror of the coremask
 * TODO: clear these functions
 */
#define CHECK_COREMASK(coremask, position) ( (1ULL << position) & (coremask) )

/*
 * CUSTOM_select expects that the clients are sorted in the priority order.
 */
uint64_t CUSTOM_select(RNS_Resource *r, uint64_t release_index) {
  uint64_t i, j;
  RNS_Client waiting;
  char *queue_id;
  int already_processing, atomic;

  for (i=0; i<r->waiting_count; i++) {
    waiting = r->waiting_queue[i];
    if (!CHECK_COREMASK(waiting.attrs->queue_coremask, release_index)) continue;

    atomic = (!strcmp(waiting.attrs->queue_type, "atomic"));

    if (atomic) {
      queue_id = waiting.attrs->queue_id;

      already_processing = 0;
      for (j=0; j<r->capacity; j++) {
        if (!r->processing_queue[j].processing) continue;
        if (j == release_index) continue;
        if (strncmp(r->processing_queue[j].attrs->queue_id, queue_id, strlen(queue_id))) continue;
        already_processing = 1;
        break;
      }

      if (already_processing) continue;
    }

    return i;
  }
  return RNS_LARGE;
}

uint64_t CUSTOM_reserve(RNS_Resource *r, uint64_t pc, RNS_Client **queue,
                        uint64_t *position, RNS_Queue_Attribute *new_attrs) {
  uint64_t i, j;
  char *queue_id = new_attrs->queue_id;
  int atomic, already_processing;

  atomic = (!strcmp(new_attrs->queue_type, "atomic"));

  // first try to place the client in the processing queue
  if (r->processing_count < r->capacity) {

    /*
     * Find the correct place to position the client
     * 1) check if the resource in position i is in use
     * 2) check that two clients from the same atomic queue wont get processed
     * 3) check if the client's coremask allows processing on this core
     */
    j = r->capacity + 1;
    already_processing = 0;
    for (i=0; i<r->capacity; i++) {
      if (r->processing_queue[i].processing) {
        if (atomic &&
            !strncmp(r->processing_queue[i].attrs->queue_id, queue_id, strlen(queue_id))) {
          already_processing = 1;
          break;
        } else continue;
      }
      if ( CHECK_COREMASK(new_attrs->queue_coremask, i) ) j = i;
    }

    if (j <= r->capacity && !already_processing) {
      *queue = r->processing_queue;
      *position = j;
      return 0;
    }
  }

  /* if there's no suitable cores (available or accepted by this client's coremask),
     place the client to waiting queue */
  *queue = r->waiting_queue;

  // find the first waiting client with higher priority, place the client right before it
  for (i=0; i<r->waiting_count; i++) {
    if (r->waiting_queue[i].attrs->queue_priority > new_attrs->queue_priority) break;
  }

  // move the clients
  for (j=r->waiting_count; j>i; j--) {
    r->waiting_queue[j] = r->waiting_queue[j-1];
  }

  *position = i;

  return 0;
}
