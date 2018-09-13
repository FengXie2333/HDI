# R 做图

The "whiskers" of the box (the vertical lines extending above and below the box) relate to the range
 parameter of boxplot, which we let default to the value 1.5 used by R. The height of the box is the
 interquartile range, the difference between the 75th and 25th quantiles. In this case that difference
 is 2.8. The whiskers are drawn to be a length of range\*2.8 or 1.5\*2.8. This shows us roughly how many,
 if any, data points are outliers, that is, beyond this range of values.

`abline` <=======> adds one or more straight lines through the current plot.

`rug()`  添加灰度条. It automatically adjusted its pocket size to that of the last plot plotted.

rug之后，可以用high和low查看分布

~~~R
hist(ppm, col = "green", breaks = 100) ###breaks:the number of buckets to split the data into	
~~~

~~~R
abline(v = median(ppm), col = "magenta", lwd = 4)  ##设置线的位置，宽度和颜色
~~~

~~~
barplot(reg, col = "wheat", main = "Number of Counties in Each Region") ###main表格的标题
~~~

~~~
 with(pollution, plot(latitude, pm25))
~~~

~~~R
abline(h=12,lwd=2, lty=2)   ### h:水平线高度 lwd宽度   lty虚线还是实线
~~~

~~~R
title(main = "Old Faithful Geyser data")  ### 添加标题
~~~



两种图形设备：向量设备和位图设备

向量设备：用于线条图，以及使用纯色，点较少的图 pdf svg

位图设备：适用于有大量的点，风景，以及基于网络的图形



lattice包很容易实现单变量或多变量的数据可视化，生成的图形为栅栏图。在一个或多个其它变量的条件下，栅栏图可展示某个变量的分布或与其他变量间的关系。 lattice包提供了丰富的图形函数，可生成单变量图形(点图、核密度图、直方图、柱形图和箱线图)、双变量图(散点图、带状图和平行箱线图)和多变量图形(三维图和散点图矩阵)。

~~~R
xyplot(Life.Exp ~ Income | region, data = state, layout = c(4,1)) ###plotting life expectancy as it depends on income for each region
~~~



##  R base做图

~~~
range(airquality$Ozone, na.rm = TRUE)
~~~

boxplot不会自动添加标题和坐标轴标签

hist会自动添加

`par()$pin`   Plot dimensions in inches   图的尺寸

`par()$fg` specifies foreground color

`par()$bg` background color

`pch`: plot character   1代表开环

`par()$lwd` line width

`par()$lty`line type  



##  Lattice

~~~R
xyplot(y ~ x | f * g, data)  ##The f and g represent the optional conditioning variables. The * represents interaction between them
~~~

Lattice适合多变量做图

str函数  紧凑的显示数据内部结构，即对象的内容

`source`  调用函数

`myedit`  查看内容

~~~R
sample(colors(), 10)  ###查看colors中随机的10个
~~~



## ggplot

~~~R
 qplot(displ, hwy, data =mpg, color = drv, geom = c("point", "smooth"))
~~~

`geom`画出趋势线

![1536550364017](C:\Users\feng\AppData\Local\Temp\1536550364017.png)

~~~R
qplot(drv, hwy, data=mpg, geom="boxplot", color=manufacturers)  ##第一个参数，用来切分数据  第二个参数，想要测量的数据 
~~~

![1536550506739](C:\Users\feng\AppData\Local\Temp\1536550506739.png)

~~~R
qplot(displ, hwy,data=mpg, facets=.~drv)  ##~左边代表行数，右边代表列
~~~





