struct RNS_Client {
  RNS_Process *process;
  RNS_Probe *usage_group;
  uint64_t pc;
  RNS_Queue_Attribute *attrs;
  int processing; // 1 processing, 0 not processing
};
