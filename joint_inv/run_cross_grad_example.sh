#!/bin/bash
# Cross gradient joint inversion example

vel_reg=10 # Regularization parameter
dc_reg=10

/opt/joint_exec/jointinv_swgravdc  --xreg 100 --writerays --substart True \
 --pickerr 0.005 --minslow 1e-3 --maxslow 0.02 \
 --crossgrad  <<eof
start_vel.nc
1
start_vel.nc
RawData.nc
0
0
1
start_res.nc
ResRawData.nc
0
1e3
0
$vel_reg
0
$dc_reg
500
eof
