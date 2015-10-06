uint64_t RNS_reserve_resource(RNS_Resource *r, char *taskname,
                              char *group, uint64_t pc,
                              RNS_Queue_Attribute *attrs) {
  RNS_Client *queue = NULL;
  uint64_t position, processing_position;
  ...
  RNS_current_process->status = r->name;
  r->reserve(r, pc, &queue, &position, attrs);
  ...
  set_client(queue, position, RNS_current_process, usage_group, pc, attrs);
  ...
  if (queue == r->waiting_queue) {
    ...
    RNS_yield();
    ...
    processing_position = RNS_current_process->scheduled_to;
  } else if (queue == r->processing_queue) {
    ...
    processing_position = position;
  }
  r->processing_queue[processing_position].processing = 1;
  ...
  return processing_position;
}
