WL_FILE_BEGIN
main
43.0
4
13
node
332.0 245.0 418.0 275.0
14
node
542.0 250.0 628.0 280.0
15
node
332.0 65.0 418.0 95.0
12
node
113.0 245.0 199.0 275.0
3
17
15
13
375.0 95.0 375.0 245.0
18
15
14
375.0 95.0 585.0 250.0
16
15
12
375.0 95.0 156.0 245.0
0
4
12
160.0 289.0
11
Stream 1 [rate: 1Gbps, size: 85B]
name:stream_1
job:SOFTWARE_1
lifetime:0.1
interval:RNS_random_exponential(0.00025)
packet_size:85*8
portnumber:1
portname:IN

drop:0


13
375.0 290.0
11
Stream 2 [rate: 4Gbps, size: 85B]
name:stream_2
job:SOFTWARE_2
lifetime:0.1
interval:RNS_random_exponential(0.00025)
packet_size:85*8
portnumber:2
portname:IN

drop:0


14
590.0 290.0
11
Stream 3 [rate: 10Gbps, size: 85B]
name:stream_3
job:SOFTWARE_3
lifetime:0.1
interval:RNS_random_exponential(0.00025)
packet_size:85*8
portnumber:3
portname:IN

drop:0


15
380.0 50.0
7
TRAFFIC GENERATOR
name:generator
lifetime:1
interval:RNS_random_exponential(0.00025)




19
WL_FILE_END
