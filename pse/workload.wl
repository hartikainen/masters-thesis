WL_FILE_BEGIN
main
43.0
2
15
node
72.0 45.0 158.0 75.0
29
node
72.0 145.0 158.0 175.0
1
30
15
29
115.0 75.0 115.0 145.0
0
3
15
120.0 30.0
25
TRAFFIC GENERATOR
name:generator

lifetime:0.05
interval:RNS_random_uniform(0.00005, 0.00015)

ExperimentOneId:1
ExperimentTwoId:2

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
100.0 100.0
42











































29
115.0 190.0
94
Stream [xGbps, 512B]
name:stream
job:SOFTWARE

lifetime:0.00004
interval:0.00000051 * RNS_random_lognormal(-10.0, 0.9)

size:512
portnumber:1
portname:IN

appid:1
drop:0


ram_access_time: RNS_random_exponential((0.00025) + (0.00025))

requiredcacheblocks:1
reservedL2blocks:0
reservedRAMblocks:0











































































31
WL_FILE_END
