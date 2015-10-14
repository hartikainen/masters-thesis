WL_FILE_BEGIN
main
43.0
3
15
node
172.0 45.0 258.0 75.0
21
node
72.0 145.0 158.0 175.0
29
node
277.0 145.0 363.0 175.0
2
26
15
21
215.0 75.0 115.0 145.0
30
15
29
215.0 75.0 320.0 145.0
0
3
15
220.0 30.0
105
TRAFFIC GENERATOR
name:generator

lifetime:0.05
interval:RNS_random_uniform(0.00005, 0.00015)

appOneId:1
appTwoId:2

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
115.0 190.0
145
Stream 1 [xGbps, 512B, exp2]
name:stream_1
job:SOFTWARE

lifetime:0.00004
interval:0.00000061 * RNS_random_lognormal(-10.0, 0.9)

size:512
portnumber:1
portname:IN
ram_access_time: RNS_random_exponential((0.00025) + (0.00025))

appid:1
drop:0

requiredcacheblocks:1
reservedL2blocks:0
reservedRAMblocks:0
































































































































29
320.0 190.0
84
Stream 2 [xGbps, 512B, exp2]
name:stream_2
job:SOFTWARE

lifetime:0.00001
interval:0.000001 * RNS_random_int(5,10)
0.00001

size:512
portnumber:2
portname:IN
ram_access_time: RNS_random_exponential((0.00025) + (0.00025))

appid:2
drop:0

requiredcacheblocks:1
reservedL2blocks:0
reservedRAMblocks:0


































































31
WL_FILE_END
