 

# Joint Inversion Utilities

## 1. What's this?

It's some joint inversion examples and tools. Including individual and joint inversion(Only KFCM inversion is included). 

The inversion binary program is not included because it's not open source. You need to contact [Dr. Shi](https://person.zju.edu.cn/szj) to fetch the original program.

Some of the real example data ("RawData.nc"and "ResRawData.nc") are not included because they're not allowed to spread it in public. If you need them, please contact [Dr. Shi](https://person.zju.edu.cn/szj). 

## 2. Individual inversion

Includes the work flow of individual inversion, there are iteration version of individual inversion(resistivity and velocity).

``` shell
>> tree
.
├── run_res.sh #iteration version, resistivity inversion
└── run_vel.sh #iteration version, velocity inversion

# Multiple Regularization Parameter;
```

**Dependency**: "jointinv_swgravdc". It's binary file yet.

## 3. Joint inversion

Includes the **data condition** parameter selection, **coupling condition** selection: 

```
>> tree
.
├── change_data_cond.sh
└── run_fcm.sh
```

