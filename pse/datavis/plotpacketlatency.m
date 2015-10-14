function [] = plotpacketlatency( start_data, end_data, figureId )
%PLOTPACKETLATENCY Summary of this function goes here
%   Detailed explanation goes here

MICRO = 1e-6;

[start_procs, I] = sort(start_data.procid_int_);
start_times = start_data.time_float_(I);

[end_procs, I] = sort(end_data.procid_int_);
end_times = end_data.time_float_(I);

latency = (end_times - start_times) / MICRO;
figure(figureId); clf;
plot(start_procs, latency);

xlabel('packet id', 'FontSize', 20);
ylabel('latency [\mus]', 'FontSize', 20);

end

