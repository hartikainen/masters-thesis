WL_FILE_BEGIN
main
35
2
0
node
317.0 72.0 387.0 102.0
1
node
311.0 169.0 381.0 199.0
1
2
0
1
352.0 102.0 346.0 169.0
0
2
0
356.0 88.0
5
TRAFFIC GENERATOR
name:generator

lifetime:1
interval:RNS_random_poisson(0.1)

1
323.0 187.0
14
test left
name:test
job:SOFTWARE

portname:IN
portnumber:RNS_random_int(0,31)
target:RNS_random_int(0, 31)

lifetime:1
interval:1
size:512




6
WL_FILE_END
