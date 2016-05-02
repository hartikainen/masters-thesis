uint64_t FCFS_select(RNS_Resource* r, uint64_t release_idx) {
  return 0;
}

uint64_t HPSF_select(RNS_Resource* r, uint64_t release_idx) {
  RNS_Client client;
  uint64_t best = INT_MIN;
  uint64_t current;
  uint64_t index, i;

  for (i = 0; i < r->waiting_count; i++) {
    client = r->waiting_queue[i];
    current = client.attrs->queue_priority;
    if (current > best) {
      best = current;
      index = i;
    }
  }
  return index;
}
