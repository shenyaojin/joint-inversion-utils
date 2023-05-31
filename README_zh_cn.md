 

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

## 3. 联合反演

包含数据项选择和耦合项参数选择的版本。

```shell
>> tree
.
├── change_data_cond.sh
└── run_fcm.sh
```
