uint64_t CUSTOM_reserve(RNS_Resource *r, RNS_Client **queue,
                        uint64_t *position, RNS_Queue_Attribute *new_client) {
  uint64_t i, j;
  char *queue_id = new_client->queue_id;
  int atomic, already_processing;
  RNS_Client client;

  atomic = (!strcmp(new_client->queue_type, "atomic"));

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
      client = r->processing_queue[i];

      if (client.processing) {
        if (atomic &&
            !strncmp(client.attrs->queue_id, queue_id, strlen(queue_id))) {
          already_processing = 1;
          break;
        } else continue;
      }
      if (CHECK_COREMASK(new_client->queue_coremask, i)) j = i;
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
    if (r->waiting_queue[i].attrs->queue_priority > new_client->queue_priority) break;
  }

  // move the clients
  for (j=r->waiting_count; j>i; j--) {
    r->waiting_queue[j] = r->waiting_queue[j-1];
  }

  *position = i;

  return 0;
}
