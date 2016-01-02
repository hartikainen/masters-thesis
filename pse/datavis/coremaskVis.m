clear all;

start_data = readtable('coremask_experiment/probe_software_start');
end_data = readtable('coremask_experiment/probe_software_end');

sso_utilization = readtable('coremask_experiment/probe_sso_utilization');
sso_queue       = readtable('coremask_experiment/probe_sso_queue');
exp3_queue_reserve = strcmp(sso_queue.taskname, 'parallel 2');
exp3_queue_release = strcmp(sso_queue.taskname, 'exp3 release core');

exp3_queue_times = sso_queue.time(exp3_queue_reserve | exp3_queue_release);
exp3_queue_lengths = cumsum(sso_queue.waitingChange(exp3_queue_reserve | exp3_queue_release));

figure(8); clf;
plot(exp3_queue_times, exp3_queue_lengths);

% EXPERIMENT 4
start_4_data = start_data(start_data.portnumber_int_ == 4, :);
end_4_data = end_data(end_data.portnumber_int_ == 4, :);

[start_procs_four, I] = sort(start_4_data.procid_int_);
start_times = start_4_data.time_float_(I);

[end_procs_four, I] = sort(end_4_data.procid_int_);
end_times = end_4_data.time_float_(I);

deltas_four = end_times - start_times;
figure(9); clf;

plot(start_procs_four, deltas_four)

start_3_data = start_data(start_data.portnumber_int_ == 3, :);
end_3_data = end_data(end_data.portnumber_int_ == 3, :);


% Core Utilization

plot(sso_utilization.time, sso_utilization.utilization)
