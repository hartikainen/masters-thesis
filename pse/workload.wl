WL_FILE_BEGIN
main
43.0
2
15
node
332.0 65.0 418.0 95.0
21
node
332.0 185.0 418.0 215.0
1
26
15
21
375.0 95.0 375.0 185.0
0
2
15
380.0 50.0
83
TRAFFIC GENERATOR
name:generator

lifetime:0.01
interval:RNS_random_uniform(0.00005, 0.00015)

SwapMacAppId:0
PacketForwardAppId:1
IPsecAppId:2
ExperimentOneId:3
ExperimentTwoId:4

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
























































21
375.0 230.0
75
Stream 1 [xGbps, 512B, exp2]
name:stream_1
job:SOFTWARE

lifetime:0.00005
interval:RNS_random_uniform(0.0000001, 0.000001)
size:512
portnumber:1
portname:IN
ram_access_time: RNS_random_exponential((0.00025) + (0.00025))

appid:4
drop:0

requiredcacheblocks:1
reservedL2blocks:0
reservedRAMblocks:0



























































29
WL_FILE_END
