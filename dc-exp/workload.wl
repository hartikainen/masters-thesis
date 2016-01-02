WL_FILE_BEGIN
main
35
3
8
node
317.0 232.0 387.0 262.0
0
node
317.0 72.0 387.0 102.0
1
node
317.0 152.0 387.0 182.0
2
9
1
8
352.0 182.0 352.0 232.0
2
0
1
352.0 102.0 352.0 152.0
0
3
8
352.0 250.0
28
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
356.0 88.0
2
TRAFFIC GENERATOR
name:generator

1
349.0 165.0
7
server
name:server

lifetime:5
interval:RNS_random_exponential(1)



10
WL_FILE_END
