void RNS_use_device(RNS_Device *d, double service_time,
                    char *taskname, char *group, uint64_t pc) {
  ...
  position = RNS_reserve_resource(d->resource, taskname,
                                  group, pc, &DEFAULT_QUEUE_ATTRS);
  RNS_delay_process(d->resource->name, service_time);
  RNS_release_resource(d->resource, taskname,  group, position);
  ...
}
