WL_FILE_BEGIN
main
35
6
4
node
145.0 85.0 215.0 115.0
9
node
345.0 25.0 415.0 55.0
10
node
345.0 145.0 415.0 175.0
2
node
45.0 85.0 115.0 115.0
12
node
45.0 165.0 115.0 195.0
7
node
245.0 85.0 315.0 115.0
2
13
2
12
80.0 115.0 80.0 165.0
11
9
10
380.0 55.0 380.0 145.0
0
6
4
180.0 140.0
6
DC image classification job
name:classificationJob
job:TG_CLASSIFICATION
portname:IN

interval:10*60

9
380.0 40.0
3
run sim
name:start
delay:2.0

10
360.0 160.0
3
exit
name:exit
control:exit

2
80.0 60.0
5
camera data
name:cameraData
interval:1

diffFromPrevious: RNS_random_uniform(0, 1)

12
80.0 180.0
11
flowlets
name:flowlets
job:TG_IMAGE
interval:0.05/*RNS_random_normal(0.05, 0.01)*/
lifetime:1
scale:1

packetLost: RNS_random_uniform(0, 1)
portname:IN

size:1000000/(1500*(1/0.05))

7
280.0 60.0
6
NN retrain
name:retrainJob
job:TG_RETRAIN
portname:IN

interval:10*60*60

14
WL_FILE_END
