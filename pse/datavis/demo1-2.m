clear all; close all;

PDF_DESTINATION = '~/code/mestari/masters-thesis/notes/meetit/2015-10-15-pse-presentation/figures/'
FIGURES = [1 2 3 4];
PACKET_SIZE = 512;
GIGA = 1e9;

% SSO queue length visualization
start_data = readtable('probe_software_start');
end_data   = readtable('probe_software_end');

sso_utilization = readtable('probe_sso_utilization');
sso_queue       = readtable('probe_sso_queue');

queue_reserve(:, 1) = strcmp(sso_queue.taskname, 'parallel 3');
queue_release(:, 1) = strcmp(sso_queue.taskname, 'release core eo1');
queue_reserve(:, 2) = strcmp(sso_queue.taskname, 'atomic 1');
queue_release(:, 2) = strcmp(sso_queue.taskname, 'release core eo2');
queue_reserve(:, 3) = strcmp(sso_queue.taskname, 'parallel 2');
queue_release(:, 3) = strcmp(sso_queue.taskname, 'release core eo3');

for i=1:3
    idx = queue_reserve(:, i) | queue_release(:, i);
    queue_times = sso_queue.time(idx);
    queue_lengths = cumsum(sso_queue.waitingChange(idx));

    fig = figure(FIGURES(i)); clf; axis tight;
    set(fig, 'Position', [0, 0, 1280, 600]);
    set(fig, 'PaperSize', [16, 10], 'PaperPositionMode','Auto');

    plot(queue_times, queue_lengths);

    title(sprintf('EO%d queue length', i), 'FontSize', 20);
    xlabel('simulation time', 'FontSize', 20);
    ylabel('queue length', 'FontSize', 20);
    
    saveas(fig, fullfile(PDF_DESTINATION, sprintf('demo-1-2-eo%d-queue', i)), 'pdf')
end

plotpacketlatency(start_data, end_data, FIGURES(4), PDF_DESTINATION, 'demo-1-2-latency');
