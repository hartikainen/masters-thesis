WL_FILE_BEGIN
main
43.0
3
15
node
332.0 65.0 418.0 95.0
29
node
437.0 185.0 523.0 215.0
21
node
232.0 185.0 318.0 215.0
2
26
15
21
375.0 95.0 275.0 185.0
30
15
29
375.0 95.0 480.0 185.0
0
5
26
351.0 115.0
7
probability:0.5







15
380.0 50.0
105
TRAFFIC GENERATOR
name:generator

lifetime:0.05
interval:RNS_random_uniform(0.00005, 0.00015)

SwapMacAppId:0
PacketForwardAppId:1
IPsecAppId:2
ExperimentOneId:3
ExperimentTwoId:4
ExperimentThreeId:5
ExperimentFourId:6

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












































































30
426.0 138.0
24
probability:1
























29
480.0 230.0
74
Stream 2 [xGbps, 512B, exp2]
name:stream_2
job:SOFTWARE

lifetime:0.00001
interval:0.000001 * RNS_random_int(5,10)
0.00001

size:512
portnumber:4
portname:IN
ram_access_time: RNS_random_exponential((0.00025) + (0.00025))

appid:6
drop:0

requiredcacheblocks:1
reservedL2blocks:0
reservedRAMblocks:0
























































21
275.0 230.0
128
Stream 1 [xGbps, 512B, exp2]
name:stream_1
job:SOFTWARE

lifetime:0.00004
interval:0.00000051 * RNS_random_lognormal(-10.0, 0.9)

size:512
portnumber:1
portname:IN
ram_access_time: RNS_random_exponential((0.00025) + (0.00025))

appid:5
drop:0

requiredcacheblocks:1
reservedL2blocks:0
reservedRAMblocks:0















































































































31
WL_FILE_END
