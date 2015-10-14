clear all;

FIGURES = [3 4];
PACKET_SIZE = 512;
GIGA = 1e9;

% SSO queue length visualization
start_data  = readtable('probe_software_start');
end_data = readtable('probe_software_end');

start_data_heavy = start_data(start_data.portnumber_int_ == 1, :);
end_data_heavy   = end_data(end_data.portnumber_int_ == 1, :);

start_data_light = start_data(start_data.portnumber_int_ == 2, :);
end_data_light   = end_data(end_data.portnumber_int_ == 2, :);

plotpacketlatency(start_data_heavy, end_data_heavy, FIGURES(1));
plotpacketlatency(start_data_light, end_data_light, FIGURES(2));

start_time = min(start_data_heavy.time_float_);
end_time   = max(end_data_heavy.time_float_);
transferred = size(start_data_heavy, 1) * PACKET_SIZE;
throughput = (transferred / (end_time - start_time)) / GIGA;

display(sprintf('Heavy stream throughput: %f GBps', throughput));
