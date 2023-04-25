#!/bin/bash
# fcm clustering

vel_reg=10
dc_reg=10

/opt/joint_exec/jointinv_swgravdc  --xreg 100 --writerays --substart True \
 --pickerr 0.002 --minslow 1e-3 --maxslow 0.02 \
 --dcrelerr 0.02 --minres 5 --maxres 400 \
 --fcmclustering  \
 --PriInform 1 <<eof
start_vel.nc
1
start_vel.nc
RawData.nc
0
0
1
start_res.nc
ResRawData.nc
2
0
1e3
0
230.69
633.70
5.18
33.54
1
$vel_reg
0
$dc_reg
500
eof
