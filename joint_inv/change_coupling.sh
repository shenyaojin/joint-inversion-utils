#!/bin/bash
# fcm clustering, using no iteration format

vel_reg=20
dc_reg=20
coupling=(100 500 1000 5000 7500 10000 20000 30000 40000 50000)

for coup_iter in ${coupling[@]}
do 
        workfolder=coup-$coup_iter
        mkdir $workfolder
        cd $workfolder
        /opt/joint_exec/jointinv_swgravdc --xreg 100 --writerays --substart True \
--pickerr 0.005 --minslow 1e-3 --maxslow 0.02 \
--dcrelerr 0.03 --minres 5 \
--maxres 450 --kfcmclustering \
--PriInform 1 <<eof
../example_data/start_vel.nc
1
../example_data/start_vel.nc
../example_data/RawData.nc
0
0
1
../example_data/start_res.nc
../example_data/ResRawData.nc
2
0
$coup_iter
0
391.93
633.70
60.33
33.54
100
$vel_reg
0
$dc_reg
1000
eof
        cd .. #cd to main folder
        cp $workfolder/misfit.out ./log/$workfolder.out #copy log file
done