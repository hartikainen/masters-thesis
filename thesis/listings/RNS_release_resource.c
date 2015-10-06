void RNS_release_resource(RNS_Resource *r, char *taskname,
                          char *group, uint64_t release_index) {
  ...
  new_index = r->select(r, release_index);

  if (r->waiting_count == 0 || new_index == RNS_LARGE) {
    // None of the waiting clients satisfy the select constrains, e.g. core group
    unset_processing(r, release_index);
  } else {
    move_to_processing(r, release_index, new_index);

    event.trigger_time = RNS_simulated_time;
    event.process = r->processing_queue[release_index].process;

    RNS_Heap_insert(event);
  }
  ...
}
