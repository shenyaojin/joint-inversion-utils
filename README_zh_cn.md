 

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

注：以上代码在相同目录下放入**观测数据**和**初始模型**后即可运行。如果需要先验数据请自行分析。或者参考我之前的分析。

