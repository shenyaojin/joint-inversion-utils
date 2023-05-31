 

# Joint Inversion Utilities

<p align="center">
<a href="./README_zh_cn.md">简体中文</a>|<a href="./README.md">English</a>
</p>

## 1. What's this?

It's some joint inversion examples and tools. Including individual and joint inversion(Only KFCM inversion is included). 

The inversion binary program is not included because it's not open source. You need to contact [Dr. Shi](https://person.zju.edu.cn/szj) to fetch the original program.

Some of the real example data ("RawData.nc" and "ResRawData.nc") are not included because they're not allowed to spread in public. If you need them, please contact [Dr. Shi](https://person.zju.edu.cn/szj). 

## 2. Individual inversion

Includes the workflow of individual inversion, there are iteration versions of individual inversion(resistivity and velocity).

``` shell
>> tree
.
├── run_res.sh #iteration version, resistivity inversion
└── run_vel.sh #iteration version, velocity inversion

# Multiple Regularization Parameter;
```

**Dependency**: "jointinv_swgravdc". It's a binary file yet.

## 3. Joint inversion

Includes the **data condition** parameter selection, ** coupling condition** selection: 

```shell
.
├── change_coupling.sh
├── change_data_condition.sh
├── run_cross_grad_example.sh
└── run_fcm_example.sh
```

**Dependency**: "jointinv_swgravdc". This is an unsourced binary.

* change_coupling: change the joint inversion of coupling parameters; usually used in the last step of parameter selection. Add the four sets of parameters analyzed in the "change_data_condition" and "run_res & run_vel" scripts at the beginning (you can refer to the example_analysis folder).
* change_data_condition: Change the joint inversion of data item parameters; usually used in the second step of parameter selection. Add the two sets of parameters analyzed in the "run_res & run_vel" script at the beginning (you can refer to the example_analysis folder).
* run_cross_grad_example: Joint inversion algorithm using cross-gradient.
* run_fcm_example: an FCM inversion using default parameters.

Note: The above code can be run after putting **observation data** and the **initial model** in the same directory. If you need prior data, please analyze it yourself. Or refer to my previous analysis (this part cannot be made public because it involves raw data).

## 4. example data

```shell
example_data
├── start_res.nc
└── start_vel.nc
```

The sample data included with this release contains the initial model generated using the program. The model parameters can be opened with panoply or with the NetCDF library (see the notebook file in utils/nc_file_generator). There are also ResRawData.txt or RawData.txt files, please refer to 1.

## 5. example analysis


```shell
example_analysis
├── change_coupling_3rd
│   ├── 10000.out
│   ...
│   └── coupling_parameter_selection.ipynb
├── change_data_cond_2nd
│   ├── 0.1-1.0-misfit.out
│   ...
└── change_reg_1st
    ├── resistivity
    │   ├── log
    │   │   ├── 1000.out
    │   │   └── ...
    │   └── res_l_curve.ipynb
    └── slowness
        ├── log
        │   ├── 1000.out
        │   └── ...
        └── vel_l_curve.ipynb
```

* change_reg_1st: This folder analyzes suitable regularization parameters using the L-curve method. (first step)
* change_data_cond_2nd: This folder uses the appropriate data term coefficients for RMS downtrend analysis. (second step)
* change_coupling_3rd: This folder uses the coupling coefficients obtained by the L-curve method. (third step)

For details, please refer to my [partial article](./example_analysis/example.pdf).

## 6. utils

```shell
utils
├── fcm_clustering
│   └── fcm_clustering_implement.py
├── nc_file_generator
│   ├── ncgen_seis.ipynb
│   └── nc_resistivity_model_gen.ipynb
└── plot_utils
    ├── l_curve_example
    │   ├── 100.out
    │   ├── ...
    │   ├── l_curve_plotter.py
    │   └── testit.py
    ├── l_curve_plotter.py
    └── rms_curve_example
        ├── 1.0-0.1-rms.out
        ├── ...
        └── res_rms.ipynb

6 directories, 29 files
```

* fcm_clustering: This is an FCM algorithm. I've packaged it into a function; note that X is a 2D array of shapes (:,2); a column is the type of the data.
* ncgen_seis: the script used to generate the initial model, I wrote the model in logarithmic form. However, there are still unknown bugs. Opening it with Panoply found that the model it generates is exactly the same as the normal model, but the input program still reports an error.
* nc_resistivity_model_gen: script to generate initial model, resistivity form.
* plot_utils: Drawing tools. l_curve_plotter is packaged into a function form, testit.py is a test script, you can refer to it; rms_curve is more difficult to package, I gave a notebook file for reference.