WL_FILE_BEGIN
main
43.0
7
22
node
517.0 155.0 603.0 185.0
23
node
687.0 175.0 773.0 205.0
15
node
332.0 65.0 418.0 95.0
19
node
157.0 215.0 243.0 245.0
20
node
307.0 155.0 393.0 185.0
12
node
58.0 155.0 144.0 185.0
21
node
437.0 225.0 523.0 255.0
6
26
15
21
375.0 95.0 480.0 225.0
27
15
22
375.0 95.0 560.0 155.0
24
15
19
375.0 95.0 200.0 215.0
28
15
23
375.0 95.0 730.0 175.0
16
15
12
375.0 95.0 101.0 155.0
25
15
20
375.0 95.0 350.0 155.0
0
9
22
570.0 200.0
21
Stream 5 [1Gbps, 1024B, app 0]
name:stream_5
job:SOFTWARE

size:1024
portnumber:5
portname:IN
ram_access_time: RNS_random_exponential((0.00025) + (0.00025))

appid:0
drop:0

requiredcacheblocks:8
reservedL2blocks:0
reservedRAMblocks:0







23
700.0 220.0
19
Stream 6 [1Gbps, 1500B, app 0]
name:stream_6
job:SOFTWARE

size:1500
portnumber:1
portname:IN
ram_access_time: RNS_random_exponential((0.00025) + (0.00025))

appid:0
drop:0

requiredcacheblocks:1500/128
reservedL2blocks:0
reservedRAMblocks:0





24
205.0 212.0
1


15
380.0 50.0
56
TRAFFIC GENERATOR
name:generator

SwapMacAppId:0
PacketForwardAppId:1
IPsecAppId:2
ExperimentOneId:3

PKIsteps:8
PKOsteps:5
IOsteps:13

commcoef:2.2
commconst:1287.5

cacheCyclesPerByte:0.6

CACHELINESIZE:128
L2SIZE:4194304
L2LINES:4194304/128
RAMspeed:1333000000
RAMwidth:9

reservedcacheblocks:0

































19
200.0 260.0
73
Stream 2 [1Gbps, 128B, app 0]
name:stream_2
job:SOFTWARE

lifetime:1
interval:0.3

size:128
portnumber:2
portname:IN
ram_access_time: RNS_random_exponential((0.00025) + (0.00025))

appid:3
drop:0

requiredcacheblocks:1
reservedL2blocks:0
reservedRAMblocks:0
























































20
350.0 200.0
27
Stream 3 [1Gbps, 256B, app 0]
name:stream_3
job:SOFTWARE

size:256
portnumber:3
portname:IN
ram_access_time: RNS_random_exponential((0.00025) + (0.00025))

appid:0
drop:0

requiredcacheblocks:2
reservedL2blocks:0
reservedRAMblocks:0













12
105.0 199.0
99
Stream 1 [1Gbps, 64B, app 0]
name:stream_1
job:SOFTWARE

lifetime:0.0001
interval:0.000000001

size:64
portnumber:1
portname:IN
ram_access_time: RNS_random_exponential((0.00025) + (0.00025))

appid:3
drop:0

requiredcacheblocks:1
reservedL2blocks:0
reservedRAMblocks:0


















































































21
490.0 270.0
22
Stream 4 [1Gbps, 512B, app 0]
name:stream_4
job:SOFTWARE

size:512
portnumber:4
portname:IN
ram_access_time: RNS_random_exponential((0.00025) + (0.00025))

appid:0
drop:0

requiredcacheblocks:4
reservedL2blocks:0
reservedRAMblocks:0








16
350.0 101.0
2



29
WL_FILE_END
