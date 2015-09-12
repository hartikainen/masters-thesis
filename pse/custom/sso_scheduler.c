#include "rns.h"
#include "sso_scheduler.h"

/*
 * CUSTOM_select expects that the clients are sorted in the priority order.
 */
uint64_t CUSTOM_select(RNS_Resource *r, RNS_Client *wait_queue, uint64_t waiting_size) {
  int i;
  RNS_Client client;

  printf("called CUSTOM_select\n");

  for (i=0; i<waiting_size; i++) {
    client = wait_queue[i];
    // printf("Client attributes: %.1s", client.attrs->queue_priority);
    if (!strcmp(client.attrs->queue_type, "atomic")) {
    }
  }

  return 0;
}

uint64_t CUSTOM_reserve(RNS_Resource *r, uint64_t pc) {
  int i;

  for (i=0; i < r->resource_size; i++) {
    //if ()
  }
  for (i=0; i < r->queue_size; i++) {
    //if (i < r->)
  }
  return r->queue_size;
}

uint64_t CUSTOM_release(RNS_Resource *r, uint64_t pc) {
  return 0;
}

/* uint64_t CUSTOM_select(RNS_Client *client, uint64_t waiting_size) { */
/*   uint64_t i; */
/*   RNS_Client c; */
/*   // priority on a scale between 1-10 */
/*   int min_priority = 10; */

/*   for (i=0; i < waiting_size; i++) { */
/*     c = client[i]; */
/*     // if the client is atomic, and one of the client's belonging */
/*     // to the same flow is being processed, move to the next packet */
/*     if (!strcmp(c.queue_type, "atomic") && c.flow_processing) continue; */
/*     if (c.priority < min_priority) min_priority = c.priority; */

/*     // can't find a packet with smaller priority */
/*     if (min_priority == 1) return i; */
/*   } */
/* } */
