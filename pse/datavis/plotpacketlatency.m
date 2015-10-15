function [] = plotpacketlatency( start_data, end_data, figureId, destination, filename )
%PLOTPACKETLATENCY Summary of this function goes here
%   Detailed explanation goes here

MICRO = 1e-6;

[start_procs, I] = sort(start_data.procid_int_);
start_times = start_data.time_float_(I);

[end_procs, I] = sort(end_data.procid_int_);
end_times = end_data.time_float_(I);

latency = (end_times - start_times) / MICRO;
fig = figure(figureId); clf;
set(fig, 'Position', [0, 0, 1280, 600]);
set(fig, 'PaperSize', [16, 10], 'PaperPositionMode','Auto');

plot(start_procs, latency);

title(sprintf('Packet latency', i), 'FontSize', 20);
xlabel('packet id', 'FontSize', 20);
ylabel('latency [\mus]', 'FontSize', 20);

saveas(fig, fullfile(destination, filename), 'pdf')
end

