WL_FILE_BEGIN
main
43.0
4
13
node
332.0 155.0 418.0 185.0
14
node
552.0 160.0 638.0 190.0
15
node
332.0 65.0 418.0 95.0
12
node
118.0 155.0 204.0 185.0
3
17
15
13
375.0 95.0 375.0 155.0
18
15
14
375.0 95.0 595.0 160.0
16
15
12
375.0 95.0 161.0 155.0
0
4
13
375.0 200.0
26
Stream 2 [4Gbps, 85B, app 1]
name:stream_2
job:SOFTWARE
lifetime:0.1
interval:RNS_random_exponential(0.00025)
size:85*8
portnumber:2
portname:IN

app_id:0
drop:0
















14
600.0 200.0
22
Stream 3 [10Gbps, 85B, app 2]
name:stream_3
job:SOFTWARE
lifetime:0.1
interval:RNS_random_exponential(0.00025)
size:85*8
portnumber:3
portname:IN

app_id:1
drop:0












15
380.0 50.0
12
TRAFFIC GENERATOR
name:generator
lifetime:1
interval:RNS_random_exponential(0.25)









12
165.0 199.0
28
Stream 1 [1Gbps, 85B, app 1]
name:stream_1
job:SOFTWARE
lifetime:0.1
interval:RNS_random_exponential(0.00025)
size:85*8
portnumber:1
portname:IN
ram_access_time: RNS_random_exponential((0.00025) + (0.00025))

app_id:0
drop:0

















19
WL_FILE_END
