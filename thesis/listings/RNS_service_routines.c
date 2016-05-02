void RNS_demand_device(RNS_Device *d, double service_amount,
                       char *taskname, char *group, uint64_t pc);

void RNS_use_device(RNS_Device *d, double service_time,
                    char *taskname, char *group, uint64_t pc);

uint64_t RNS_reserve_resource(RNS_Resource *r, char *taskname,
                              char *group, uint64_t pc,
                              RNS_Queue_Attribute *attrs);

void RNS_delay_process(char *name, double seconds);

void RNS_release_resource(RNS_Resource *r, char *taskname,
                          char *group, uint64_t release_index);
