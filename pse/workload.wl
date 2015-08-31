WL_FILE_BEGIN
main
43.0
2
15
node
332.0 65.0 418.0 95.0
12
node
178.0 155.0 264.0 185.0
1
16
15
12
375.0 95.0 221.0 155.0
0
2
15
380.0 50.0
27
TRAFFIC GENERATOR
name:generator
interval:RNS_random_exponential(0.25)

SwapMacAppId:0
PacketForwardAppId:1
IPsecAppId:2

PKIsteps:8
PKOsteps:5

commcoef:4.4
commconst:5048.9

highestprio:1
atomicflow:1
notprocessable:0
coreready:1

cachelinesize:128
L2size:4000000
L2linecount:4000000/128
RAMspeed:1333000000
RAMwidth:9




12
225.0 199.0
28
Stream 1 [1Gbps, 64B, app 1]
name:stream_1
job:SOFTWARE

size:64
portnumber:1
portname:IN
ram_access_time: RNS_random_exponential((0.00025) + (0.00025))

appid:0
drop:0


















19
WL_FILE_END
