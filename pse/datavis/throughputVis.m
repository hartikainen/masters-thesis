clear all;

% experiment one
input_data      = readtable('experiment_one/probe_software_start');
output_data     = readtable('experiment_one/probe_software_end');

[input_procs_one, I] = sort(input_data.procid_int_);
input_times = input_data.time_float_(I);

[output_procs_one, I] = sort(output_data.procid_int_);
output_times = output_data.time_float_(I);

deltas_one = output_times - input_times;

figure(6); clf;
plot(input_procs_one, deltas_one);

% experiment two
input_data      = readtable('experiment_two/probe_software_start');
output_data     = readtable('experiment_two/probe_software_end');

[input_procs_two, I] = sort(input_data.procid_int_);
input_times = input_data.time_float_(I);

[output_procs_two, I] = sort(output_data.procid_int_);
output_times = output_data.time_float_(I);

deltas_two = output_times - input_times;
throughput_two = min(input_times)

figure(7); clf;
plot(input_procs_two, deltas_two);
