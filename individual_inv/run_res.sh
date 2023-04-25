#!/bin/bash
# Individual Inversion (Resistivity)
# Multiple Regularization Parameter
# dependency: "jointinv_swgravdc". It's binary file yet.

par_reg=(5 10 20 50 100 500 1000)

for res_iter in ${par_reg[@]}
do
    workfolder=$res_iter
    mkdir $workfolder
    cd $workfolder
    /opt/joint_exec/jointinv_swgravdc --xreg 100 --curvreg --substart True \
--dcrelerr 0.02 --dcminerr 0.0 --minres 5 --maxres 400 \
--crossgrad  <<eof
../start_vel.nc
0
0
0
1
../start_res.nc
../ResRawData.nc
0
0
0
0
0
$res_iter
1000
eof
cd ..
done

