WL_FILE_BEGIN
main
35
5
4
node
245.0 205.0 315.0 235.0
10
node
545.0 185.0 615.0 215.0
9
node
545.0 125.0 615.0 155.0
2
node
125.0 205.0 195.0 235.0
7
node
365.0 205.0 435.0 235.0
1
11
9
10
580.0 155.0 580.0 185.0
0
5
4
260.0 200.0
3
DC image classification job
interval: 10min
tarkemmin anomaaliset kuvat

10
560.0 200.0
3
exit
name:exit
control:exit

9
580.0 140.0
3
run sim
name:start
delay:2.0

2
140.0 200.0
2
camera data
interval:RNS_random_normal(..., ...)

7
400.0 200.0
2
NN retrain
interval:x hours

12
WL_FILE_END
