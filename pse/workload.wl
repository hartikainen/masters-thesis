WL_FILE_BEGIN
main
43.0
4
13
node
332.0 155.0 418.0 185.0
14
node
512.0 160.0 598.0 190.0
15
node
332.0 65.0 418.0 95.0
12
node
158.0 155.0 244.0 185.0
3
17
15
13
375.0 95.0 375.0 155.0
18
15
14
375.0 95.0 555.0 160.0
16
15
12
375.0 95.0 201.0 155.0
0
4
13
375.0 200.0
21
Stream 2 [4Gbps, 85B]
name:stream_2
job:SOFTWARE
lifetime:0.1
interval:RNS_random_exponential(0.00025)
size:85*8
portnumber:2
portname:IN

drop:0












14
560.0 200.0
17
Stream 3 [10Gbps, 85B]
name:stream_3
job:SOFTWARE
lifetime:0.1
interval:RNS_random_exponential(0.00025)
size:85*8
portnumber:3
portname:IN

drop:0








15
380.0 50.0
12
TRAFFIC GENERATOR
name:generator
lifetime:1
interval:RNS_random_exponential(0.25)









12
205.0 199.0
24
Stream 1 [1Gbps, 85B]
name:stream_1
job:SOFTWARE
lifetime:0.1
interval:RNS_random_exponential(0.00025)
size:85*8
portnumber:1
portname:IN
ram_access_time: RNS_random_exponential(0.00025) + (0.00025)

drop:0














19
WL_FILE_END
