void WL_flow() {
  RN_Process *p;
  double birth = RNS_simulated_time;
  p = NULL;

  int BYTES = 8;
  int PACKET_SIZE = 1024 * BYTES;

  int spineId = RNS_random_int(0,1);
  int spineLeaf = RNS_random_int(0,1);
  int leafSpine = RNS_random_int(0,1);
  int target = RNS_random_int(0, 31);
  int source = RNS_random_int(0,31);

  int flow_size = RNS_random_weibull(100, 0.1);
  if (flow_size < 128) flow_size = 128;
  int packets = (flow_size / PACKET_SIZE);

  int i=0;
  do {
    p = RN_create_process(root, "HARDWARE", "IN", 0);
    RN_add_binding(p, "spineId", spineId);
    RN_add_binding(p, "spineLeaf", spineLeaf);
    RN_add_binding(p, "leafSpine", leafSpine);
    RN_add_binding(p, "target", target);
    RN_add_binding(p, "source", source);
    RN_init_request_HARDWARE(p, "IN");
    RNS_push_int((intptr_t)p);
    RNS_process("SOFTWARE", WL8_proc, NULL);
    RNS_delay_process("WL_interval", RNS_random_normal(0.0000001));
  } while (i++ < packets);
  birth = 0.0;
}
