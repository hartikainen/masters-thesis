uint64_t reserve(RNS_Resource *r,
                 RNS_Client **queue,
                 uint64_t *position,
                 RNS_Queue_Attribute *new_attrs) {
  uint64_t i;

  if (r->processing_count < r->capacity) {
    for (i=0; i<r->capacity; i++) {
      if (!(r->processing_queue[i].processing)) break;
    }
    *queue = r->processing_queue;
    *position = i;
  } else {
    *queue = r->waiting_queue;
    *position = r->waiting_count;
  }
  return 0;
}
