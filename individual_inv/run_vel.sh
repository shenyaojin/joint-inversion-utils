#!/bin/bash
# velocity individual inversion. Iteration on regularization parameter.

par_reg=(5 10 20 50 100 500 1000)

for vel_iter in ${par_reg[@]}
do
    workfolder=$vel_iter
    mkdir $workfolder
    cd $workfolder
    /opt/joint_exec/jointinv_swgravdc  --xreg 100 --writerays --substart True \
 --pickerr 0.005 --minslow 1e-3 --maxslow 0.02 \
 --crossgrad  <<eof
../start_vel.nc
1
../start_vel.nc
../RawData.nc
0
0
0
0
0
0
$vel_iter
0
0
500
eof
cd ..
done
