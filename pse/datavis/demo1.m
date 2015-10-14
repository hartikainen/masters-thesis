clear all;

FIGURES = [3 4];

% SSO queue length visualization
start_data  = readtable('probe_software_start');
end_data = readtable('probe_software_end');

[input_procs_one, I] = sort(start_data.procid_int_);
input_times = start_data.time_float_(I);

[output_procs_one, I] = sort(end_data.procid_int_);
output_times = end_data.time_float_(I);

deltas_one = output_times - input_times;

figure(FIGURES(1)); clf;
plot(input_procs_one, deltas_one);