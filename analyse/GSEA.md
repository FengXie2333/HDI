# GSEA

## 一、GSEA的特点

**在我们的输入的文件“基因表达文件”中，给出的不仅是基因名，还有所有基因的表达值。这与我们进行GO/Pathway分析时输入差异表达的基因是不同的，我们在做GO/Pathway富集分析的时候，是首先判断差异表达基因，然后再看差异表达的基因所参与的功能；而GSEA分析则根据一组基因的整体表达趋势来看该组基因是否有差异。**

**比如：常规的GO/Pathway分析是这样：先从10000个基因中找到差异基因800个（倍数>1.5倍），然后再分析功能；而GSEA则把10000个基因全部放进来，不管差异倍数是1.5还是1.1，统统进行考量和富集。再极端一点，如果某条通路的分子大部分都被上调了，但是倍数只有1.3倍，常规的分析会遗漏该通路，而GSEA分析则能找出来。这一点是GSEA与常规富集分析最大的区别。**



## 二、数据准备

### Expression Data Formats

#### 1 GCT: Gene Cluster Text file format (*.gct)

![](https://i.loli.net/2018/12/05/5c078807e651a.jpg)

其他格式详见[Data formats](http://software.broadinstitute.org/cancer/software/gsea/wiki/index.php/Data_formats#Expression_Data_Formats)

&nbsp;

**注意事项**：

R存文件时要存成用\t分隔(txt或tsv)。或者存成.csv再改成txt。

&nbsp;

#### 2 Phenotype Data Formats

#### CLS: Categorical (e.g tumor vs normal) class file format (*.cls)

![](https://i.loli.net/2018/12/05/5c0788cde0605.jpg)

&nbsp;

## 3 Gene Set Database Formats

可以参照Data Frame中的格式自己制作。也可以[Molecular Signatures Database (MSigDB)](http://software.broadinstitute.org/gsea/msigdb/index.jsp)下载

&nbsp;

## 4 Microarray Chip Annotation Formats

chip文件可以在Run GSEA时选择，但是我运行时加载不出web上的库。这个也可以自己DIY。DAVID和bioDBnet可以转换Gene ID([[简述几种Gene ID的转换方法](http://t43983006.lofter.com/post/1d0b3057_cd5afb9)])



# 三、运行和结果分析

[GSEA使用介绍](https://www.plob.org/article/10815.html)

