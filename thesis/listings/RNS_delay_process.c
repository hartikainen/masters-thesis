void RNS_delay_process(char *name, double seconds) {
  RNS_Event event;
  ...
  event.trigger_time = RNS_simulated_time + seconds;
  event.process = RNS_current_process;
  ...
  RNS_Heap_insert(event);
  RNS_yield();
  ...
}
