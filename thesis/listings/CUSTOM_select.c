uint64_t CUSTOM_select(RNS_Resource *r, uint64_t release_index) {
  uint64_t i, j;
  RNS_Client waiting;
  char *qid;
  int already_processing, atomic;

  for (i=0; i<r->waiting_count; i++) {
    waiting = r->waiting_queue[i];

    if (!CHECK_COREMASK(waiting.attrs->queue_coremask, release_index)) continue;

    atomic = (!strcmp(waiting.attrs->queue_type, "atomic"));

    if (atomic) {
      qid = waiting.attrs->queue_id;

      already_processing = 0;
      for (j=0; j<r->capacity; j++) {
        client = r->processing_queue[j];
        if (!client.processing) continue;
        if (j == release_index) continue;
        if (strncmp(client.attrs->queue_id, qid, strlen(qid))) continue;
        already_processing = 1;
        break;
      }

      if (already_processing) continue;
    }

    return i;
  }
  return RNS_LARGE;
}
