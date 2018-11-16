# GO代码学习

将data frame 存为excel用

~~~R
write.csv(object, filename="XXX.csv")
~~~

将factor转化为数字：`as.numberic`

&nbsp;

将数据框markers的第一列命名为gene

~~~R
names(markers)[1]<- "gene"
~~~

&nbsp;

将符合要求的数据提取出来

~~~R
t1 <- which(markers$cluster==14)
markers <- markers[t1,]
~~~

~~~R
sg = markers[markers$p_val<0.01,]
~~~



