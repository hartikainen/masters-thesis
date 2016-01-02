WL_FILE_BEGIN
main
35
3
8
node
37.0 212.0 107.0 242.0
0
node
37.0 52.0 107.0 82.0
1
node
37.0 132.0 107.0 162.0
2
9
1
8
72.0 162.0 72.0 212.0
2
0
1
72.0 82.0 72.0 132.0
0
3
8
72.0 228.0
22
flow
name:flow
job:SOFTWARE
portname:IN


lifetime: custom

source:RNS_random_int(0,31)
target:RNS_random_int(0, 31)
leafSpine:RNS_random_int(0,1)
spineLeaf:RNS_random_int(0,1)
spineId:RNS_random_int(0,1)










0
75.0 40.0
2
TRAFFIC GENERATOR
name:generator

1
72.0 147.0
7
server
name:server

lifetime:5
interval:RNS_random_exponential(1)



10
WL_FILE_END
