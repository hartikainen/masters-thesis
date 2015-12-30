WL_FILE_BEGIN
main
35
3
0
node
317.0 72.0 387.0 102.0
4
node
405.0 145.0 475.0 175.0
1
node
111.0 169.0 181.0 199.0
2
5
0
4
352.0 102.0 440.0 145.0
2
0
1
352.0 102.0 146.0 169.0
0
3
4
418.0 171.0
12
test right
name:testright
job:SOFTWARE

portnumber:RNS_random_int(0, 31)
portname:RIGHT

lifetime:1
interval:0.1
size:512

target:RNS_random_int(0, 31)

0
356.0 88.0
10
TRAFFIC GENERATOR
name:generator

lifetime:1
interval:RNS_random_poisson(1)






1
123.0 187.0
12
test left
name:testleft
job:SOFTWARE

portnumber:RNS_random_int(0, 31)
portname:LEFT

lifetime:1
interval:0.1
size:512

target:RNS_random_int(0, 31)

6
WL_FILE_END
