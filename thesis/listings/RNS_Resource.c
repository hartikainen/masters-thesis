struct RNS_Resource {
  uint64_t id;
  char *name;
  RNS_Probe *probes[RNS_SMALL];
  uint64_t probe_count;
  char *group_name;

  uint64_t (*select)(struct RNS_Resource*, uint64_t);
  uint64_t (*reserve)(struct RNS_Resource*, RNS_Client**,
                      uint64_t*, RNS_Queue_Attribute*);
  uint64_t capacity;
  RNS_Client *processing_queue;
  uint64_t processing_count;
  RNS_Client waiting_queue[RNS_LARGE];
  uint64_t waiting_count;
};
