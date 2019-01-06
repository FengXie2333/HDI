# Basic

## 统计学分布和抽样

### Distributin

Curve tells us the same thing with histogram, but it has few advantages:

- we can estimate values that we don't measure

- the curve is not limited by the width of bins

- approximate curve is usually good enough when we don't have enough data

### Normal distibution

![1530628533980](C:\Users\feng\AppData\Local\Temp\1530628533980.png)

normal distribution : 正态分布

Standard deviation ：方差

normal curve：mean +/- 2*SD

The width of curve determine how tall it is. The wider the curve, the shorter 

### Statistical model

we use models to explore relationships

we use statistics to determine how useful and how reliable our model is.

### Sampling distribution

![1530629526100](C:\Users\feng\AppData\Local\Temp\1530629526100.png)

### Technical， biological and other replicates

 ![1530705372164](C:\Users\feng\AppData\Local\Temp\1530705372164.png)

Technical replicates ：single experiment is performed on the exact same sample.

1. they give us an accurate measurement of this due's gene expression
2. they tell us how accurately we're measuring gene expression

Biological replicates : use different biological sources of samples

### Sample size and effective sample size

![1530710110910](C:\Users\feng\AppData\Local\Temp\1530710110910.png) 

![1530710162300](C:\Users\feng\AppData\Local\Temp\1530710162300.png)

![1530710196216](C:\Users\feng\AppData\Local\Temp\1530710196216.png)

effective sample size = The number of samples/1+(the number of samples-1)*correlation

### Standard Deviation vs Standard error

Standard deviation：it quantifies of how much the data are spread out

Standard error : the standard deviation of the means (can be estimated from a sigle set of measurements)

### Pie or Bar Chards

### Confidence Intervals

1. randomly select several sampels, duplicates are ok
2. caculate means
3. repeat step1 and step2 until have a lot of means

95% confidence interval is intreval that covers 95% of the means

the p-value of anything outside of the confiddence interval is <0.05 

### Standard errors explianed and a bootstrapping bonus

you can caculate the standard deviation of any statistic that you caculate for multiple samples named "standard error of ......“