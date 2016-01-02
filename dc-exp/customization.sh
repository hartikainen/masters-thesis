FROM='  int i\; \/\* selection to leafServer \*\/'
TO='  int i\; \/\* selection to leafServer \*\/\
  int target = (int)RN_get_binding(p, "target");\
  p->next.state.node_index = target;\
  p->next.port_name = 0;\
  p->next.port_number = 0;\
  \/\/printf("target: %d\\n", target);\
  return;\
'

sed -i "s/$FROM/$TO/g" ./RN_hardware.c

FROM='  int i\; \/\* selection to serverLeaf \*\/'
TO='  int i\; \/\* selection to serverLeaf \*\/\
  int target = (int)RN_get_binding(p, "source");\
  p->next.state.node_index = target;\
  p->next.port_name = 0;\
  p->next.port_number = 0;\
  \/\/printf("source: %d\\n", target);\
  return;\
'

sed -i "s/$FROM/$TO/g" ./RN_hardware.c

FROM='  int i\; \/\* selection to leaf0Spine0 \*\/'
TO='  int i\; \/\* selection to leaf0Spine0 \*\/\
  int target = (int)RN_get_binding(p, "leafSpine");\
  p->next.state.node_index = target;\
  p->next.port_name = 0;\
  p->next.port_number = 0;\
  \/\/printf("leafSpine: %d\\n", target);\
  return;\
'

sed -i "s/$FROM/$TO/g" ./RN_hardware.c

FROM='  int i\; \/\* selection to leaf0Spine1 \*\/'
TO='  int i\; \/\* selection to leaf0Spine1 \*\/\
  int target = (int)RN_get_binding(p, "leafSpine");\
  p->next.state.node_index = target;\
  p->next.port_name = 0;\
  p->next.port_number = 0;\
  \/\/printf("leafSpine: %d\\n", target);\
  return;\
'

sed -i "s/$FROM/$TO/g" ./RN_hardware.c

FROM='  int i\; \/\* selection to spine0Leaf1 \*\/'
TO='  int i\; \/\* selection to spine0Leaf1 \*\/\
  int target = (int)RN_get_binding(p, "spineLeaf");\
  p->next.state.node_index = target;\
  p->next.port_name = 0;\
  p->next.port_number = 0;\
  \/\/printf("spineLeaf: %d\\n", target);\
  return;\
'

sed -i "s/$FROM/$TO/g" ./RN_hardware.c

FROM='  int i\; \/\* selection to spine1Leaf1 \*\/'
TO='  int i\; \/\* selection to leaf1Spine1 \*\/\
  int target = (int)RN_get_binding(p, "spineLeaf");\
  p->next.state.node_index = target;\
  p->next.port_name = 0;\
  p->next.port_number = 0;\
  \/\/printf("spineLeaf: %d\\n", target);\
  return;\
'

sed -i "s/$FROM/$TO/g" ./RN_hardware.c

FROM='    RNS_process("WL_server", WL_server, NULL)\;'
TO='    int i;\
    for (i=0; i<32; i++) {\
      RNS_process("WL_server", WL_server, NULL)\;\
    }'

sed -i "s/$FROM/$TO/g" ./WL_workload.c


FROM='void WL_flow() {'
TO='void WL_flow() {\
  int BYTES = 8\;\
  int PACKET_SIZE = 1024 * BYTES\;\
  int flow_size = RNS_random_weibull(100, 0.1)\;\
  if (flow_size < 128) flow_size = 128\;\
  int packets = (flow_size \/ PACKET_SIZE)\;\
  int i=0\;\
'
sed -i "s/$FROM/$TO/g" ./WL_workload.c

FROM='  } while (RNS_simulated_time < birth + custom)\;'
TO='  } while (i++ < packets)\;'

sed -i "s/$FROM/$TO/g" ./WL_workload.c
