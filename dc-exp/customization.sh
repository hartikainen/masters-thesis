FROM='  int i\; \/\* selection to serverLeaf \*\/'
TO='  int i\; \/\* selection to serverLeaf \*\/\
  int target = (int)RN_get_binding(p, "source");\
  p->next.state.node_index = target;\
  p->next.port_name = 0;\
  p->next.port_number = 0;\
  return;\
'

sed -i "s/$FROM/$TO/g" ./RN_hardware.c

FROM='  int i\; \/\* selection to leafServer \*\/'
TO='  int i\; \/\* selection to leafServer \*\/\
  int target = (int)RN_get_binding(p, "target");\
  p->next.state.node_index = target;\
  p->next.port_name = 0;\
  p->next.port_number = 0;\
  return;\
'

sed -i "s/$FROM/$TO/g" ./RN_hardware.c
