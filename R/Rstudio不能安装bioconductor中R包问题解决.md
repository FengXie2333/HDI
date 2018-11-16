# Rstudio不能安装bioconductor中R包问题解决

![](https://i.loli.net/2018/10/22/5bcd8031d16fc.png)   

   

尝试tools-global options-packages更改镜像未成功



最终解决方案：

更改为

~~~R
source("http://www.bioconductor.org/biocLite.R")
~~~

