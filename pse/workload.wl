WL_FILE_BEGIN
main
43.0
3
8
node
226.0 191.0 312.0 221.0
2
node
5.0 178.0 91.0 208.0
7
node
140.0 45.0 226.0 75.0
2
9
7
2
183.0 75.0 48.0 178.0
11
7
8
183.0 75.0 269.0 191.0
0
5
8
256.0 205.0
19
LARGE TASK
name:large_task
group:msg
job:SOFTWARE
codelines:RNS_random_int(100000,200000)
datasize:RNS_random_int(10000,50000)
cachelines:RNS_random_int(1000,2000)
LIreadhit:RNS_random_bernoulli(0.4)
LIwritehit:RNS_random_bernoulli(0.1)
branchA:RNS_random_bernoulli(0.9)
portnumber:1
portname:IN








9
120.0 122.0
3
0.7
probability:0.7


2
50.0 197.0
13
small task
name:small_task
group:msg
job:SOFTWARE
lifetime:RNS_random_uniform(0.00001, 0.0003)
interval:RNS_random_uniform(0.000001, 0.000002)
codelines:RNS_random_int(100,1500)
cachelines:RNS_random_int(100,500)
portnumber:1
portname:IN




11
225.0 133.0
3
0.5
probability:0.5


7
172.0 61.0
6
WL GENERATOR
name:generator
lifetime:0.01
interval:RNS_random_exponential(0.00025)



12
WL_FILE_END
