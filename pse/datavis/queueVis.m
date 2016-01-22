clear all;

% input_data      = readtable('probe_software_start');
% output_data     = readtable('probe_software_end');


exp1_sso_utilization = readtable('experiment_one/probe_sso_utilization');
exp1_sso_queue       = readtable('experiment_one/probe_sso_queue');

% Experiment one

% EO 1 waiting queue vis

exp1_eo1_queue_reserve = strcmp(exp1_sso_queue.taskname, 'parallel 3');
exp1_eo1_queue_release = strcmp(exp1_sso_queue.taskname, 'release core eo1');
exp1_eo2_queue_reserve = strcmp(exp1_sso_queue.taskname, 'atomic 1');
exp1_eo2_queue_release = strcmp(exp1_sso_queue.taskname, 'release core eo2');
exp1_eo3_queue_reserve = strcmp(exp1_sso_queue.taskname, 'parallel 2');
exp1_eo3_queue_release = strcmp(exp1_sso_queue.taskname, 'release core eo3');

exp1_eo1_queue_times = exp1_sso_queue.time(exp1_eo1_queue_reserve | exp1_eo1_queue_release);
exp1_eo1_queue_lengths = cumsum(exp1_sso_queue.waitingChange(exp1_eo1_queue_reserve | exp1_eo1_queue_release));

exp1_eo2_queue_times = exp1_sso_queue.time(exp1_eo2_queue_reserve | exp1_eo2_queue_release);
exp1_eo2_queue_lengths = cumsum(exp1_sso_queue.waitingChange(exp1_eo2_queue_reserve | exp1_eo2_queue_release));

exp1_eo3_queue_times = exp1_sso_queue.time(exp1_eo3_queue_reserve | exp1_eo3_queue_release);
exp1_eo3_queue_lengths = cumsum(exp1_sso_queue.waitingChange(exp1_eo3_queue_reserve | exp1_eo3_queue_release));

figure(1); clf;
plot(exp1_eo1_queue_times, exp1_eo1_queue_lengths);

figure(2); clf;
plot(exp1_eo2_queue_times, exp1_eo2_queue_lengths);

figure(3); clf;
plot(exp1_eo3_queue_times, exp1_eo3_queue_lengths);

% Experiment two

exp2_sso_utilization = readtable('experiment_two/probe_sso_utilization');
exp2_sso_queue       = readtable('experiment_two/probe_sso_queue');

exp2_eo1_queue_reserve = strcmp(exp2_sso_queue.taskname, 'parallel 2');
exp2_eo1_queue_release = strcmp(exp2_sso_queue.taskname, 'release core eo1');
exp2_eo2_queue_reserve = strcmp(exp2_sso_queue.taskname, 'atomic 1');
exp2_eo2_queue_release = strcmp(exp2_sso_queue.taskname, 'release core eo2');

exp2_eo1_queue_times = exp2_sso_queue.time(exp2_eo1_queue_reserve | exp2_eo1_queue_release);
exp2_eo1_queue_lengths = cumsum(exp2_sso_queue.waitingChange(exp2_eo1_queue_reserve | exp2_eo1_queue_release));

exp2_eo2_queue_times = exp2_sso_queue.time(exp2_eo2_queue_reserve | exp2_eo2_queue_release);
exp2_eo2_queue_lengths = cumsum(exp2_sso_queue.waitingChange(exp2_eo2_queue_reserve | exp2_eo2_queue_release));

figure(4); clf;
plot(exp2_eo1_queue_times, exp2_eo1_queue_lengths);

figure(5); clf;
plot(exp2_eo2_queue_times, exp2_eo2_queue_lengths);
