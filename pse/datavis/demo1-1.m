clear all;

FIGURES = [1 2 3 4];
PACKET_SIZE = 512;
GIGA = 1e9;

% SSO queue length visualization
start_data = readtable('probe_software_start');
end_data   = readtable('probe_software_end');

sso_utilization = readtable('probe_sso_utilization');
sso_queue       = readtable('probe_sso_queue');

queue_reserve(:, 1) = strcmp(sso_queue.taskname, 'parallel 1');
queue_release(:, 1) = strcmp(sso_queue.taskname, 'release core eo1');
queue_reserve(:, 2) = strcmp(sso_queue.taskname, 'atomic 1');
queue_release(:, 2) = strcmp(sso_queue.taskname, 'release core eo2');

for i=1:2
    idx = queue_reserve(:, i) | queue_release(:, i);
    queue_times = sso_queue.time(idx);
    queue_lengths = cumsum(sso_queue.waitingChange(idx));

    figure(FIGURES(i)); clf;
    plot(queue_times, queue_lengths);
    title(sprintf('EO%s queue length', i));
    xlabel('simulation time', 'FontSize', 15);
    ylabel('queue length', 'FontSize', 15);
end
    

plotpacketlatency(start_data, end_data, FIGURES(4));
