 

# 联合反演工具

<p align="center">
<a href="./README_zh_cn.md">简体中文</a>|<a href="./README.md">English</a>
</p>

## 1. 这是什么？

这是用于联合反演的例子和工具包；包括了单独反演和联合反演（仅KFCM）的部分。

部分反演程序是未开源的二进制程序，如果需要请去联系[石战结](https://person.zju.edu.cn/szj)副教授。

部分实例数据("RawData.nc" 和 "ResRawData.nc") 并未被包含在仓库中。我还没有取得许可，因此无法在公众传播。如果你需要它们，请联系[石战结](https://person.zju.edu.cn/szj)副教授。

## 2. 单独反演

包括了单独反演的工作流程。在仓库中我附上了单独反演的变正则化参数迭代版本。

``` shell
>> tree
.
├── run_res.sh #iteration version, resistivity inversion
└── run_vel.sh #iteration version, velocity inversion

# Multiple Regularization Parameter;
```

**依赖**: "jointinv_swgravdc"。这是未被开源的二进制文件。
运行方式：在相同目录下放入**观测数据**和**初始模型**后即可运行，其他代码运行方式类似。

```shell
chmod -R 755 run_res.sh && ./run_res.sh
```

## 3. 联合反演

包含数据项选择和耦合项参数选择的版本。

```shell
>> tree
joint_inv
├── change_coupling.sh
├── change_data_condition.sh
├── run_cross_grad_example.sh
└── run_fcm_example.sh
```
**依赖**: "jointinv_swgravdc"。这是未被开源的二进制文件。

* change_coupling：改变耦合参数的联合反演；通常用于参数选择的最后一步。在开始部分加入“change_data_condition”和“run_res & run_vel”脚本中分析得到的四组参数（可以参考example_analysis文件夹）。
* change_data_condition: 改变数据项参数的联合反演；通常用于参数选择的第二步。在开始部分加入“run_res & run_vel”脚本中分析得到的两组参数（可以参考example_analysis文件夹）。
* run_cross_grad_example：使用交叉梯度的联合反演算法。
* run_fcm_example：一个使用默认参数的fcm反演。

注：以上代码在相同目录下放入**观测数据**和**初始模型**后即可运行。如果需要先验数据请自行分析。或者参考我之前的分析（该部分因为涉及原始数据，因此无法公开）。

## 4. example data（示例数据）

```shell
example_data
├── start_res.nc
└── start_vel.nc
```

此版本包含的示例数据包含使用程序生成的初始模型。该模型参数可以用panoply或是用netcdf库打开（可以参考utils/nc_file_generator里的notebook文件）。还有ResRawData.txt或是RawData.txt文件请参见1。

## 5. example analysis (示例分析)

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

* change_reg_1st：这个文件夹使用L-曲线法分析合适的正则化参数。（第一步）
* change_data_cond_2nd: 这个文件夹使用RMS下降趋势分析合适的数据项系数。（第二步）
* change_coupling_3rd：这个文件夹使用L-曲线法得到的耦合项系数。（第三步）

具体可以参考我的[部分文章](./example_analysis/example.pdf)。

## 6. utils（工具）

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

* fcm_clustering: 这是一个fcm的算法。我已经打包成了函数；注意X是(:,2)形状的ndarray；一列列是数据的类型。
* ncgen_seis：用来生成初始模型的脚本，我写了对数形式的模型。但是仍存在未知bug，用panoply打开发现它生成的模型和正常模型一模一样，但是输入程序仍会报错。
* nc_resistivity_model_gen：生成初始模型的脚本，电阻率形式。
* plot_utils: 画图工具。l_curve_plotter是打包成函数的形式，testit.py是测试脚本，可以参考；rms_curve比较难打包，我给出了一个notebook文件用于参考。

