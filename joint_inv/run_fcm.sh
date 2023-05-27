#!/bin/bash
# FCM clustering, linear initial model.

vel_reg=30 # Regularization parameter (velocity)
res_reg=30 # Regularization parameter (resistivity)
/opt/joint_exec/jointinv_swgravdc --xreg 100 --curvreg --substart True \
--dcrelerr 0.02 --dcminerr 0.0 --minres 5 --maxres 400 \
--fcmclustering <<eof
../example_data/start_vel.nc
0
0
0
1
../example_data/start_res.nc
../example_data/ResRawData.nc
1
0
0
$vel_reg
0
$res_reg
500
eof

