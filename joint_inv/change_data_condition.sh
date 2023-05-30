#!/bin/bash
# change lambda(SRT & ERT)

vel_reg=20
dc_reg=20
seis_lambda=(0.1 0.2 0.5 1.0 2.0 5.0 10.0 20.0 30.0)
res_lambda=(0.1 0.2 0.5 1.0 2.0 5.0 10.0 20.0 30.0)
mkdir -p log
for vel_iter in ${seis_lambda[@]}
do
    for dc_iter in ${res_lambda[@]}
    do
        workfolder=$vel_iter-$dc_iter
        mkdir $workfolder
        cd $workfolder
        /opt/joint_exec/jointinv_swgravdc --xreg 100 --writerays --substart True \
--pickerr 0.005 --minslow 1e-3 --maxslow 0.02 \
--dcrelerr 0.03 --minres 5 \
--maxres 450 --kfcmclustering \
--PriInform 1 <<eof
../start_vel.nc
$vel_iter
../start_vel.nc
../RawData.nc
0
0
$dc_iter
../start_res.nc
../ResRawData.nc
2
0
1e3
0
873.35
633.70
19.64
33.54
1
$vel_reg
0
$dc_reg
1000
eof
        cd .. #cd to main folder
        cp $workfolder/rms.out ./log/$workfolder-rms.out #copy log file
        cp $workfolder/misfit.out ./log/$workfolder-misfit.out #copy misfit file
        done
done
