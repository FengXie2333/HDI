#  WGCNA(weighted gene co-expression network analysis)

## 教程

plob教程：https://www.plob.org/article/10682.html

 

WGCNA所分析的数据是芯片数据（需要砸很多芯片，比如若要研究细胞凋亡，那么使用改方法需要实验者提供细胞凋亡各个时期的芯片数据，以了解这一生理过程中细胞内所有基因的表达变化)。



从方法上来讲，WGCNA分为**表达量聚类分析和表型关联**两部分，主要包括基因之间相关系数计算、基因模块的确定、共表达网络、模块与性状关联四个步骤

第一步计算任意两个基因之间的相关系数（Person Coefficient）。为了衡量两个基因是否具有相似表达模式，一般需要设置阈值来筛选，高于阈值的则认为是相似的。但是这样如果将阈值设为0.8，那么很难说明0.8和0.79两个是有显著差别的。因此，**WGCNA分析时采用相关系数加权值，即对基因相关系数取N次幂**，使得网络中的基因之间的连接服从**无尺度网络分布(scale-freenetworks)**，这种算法更具生物学意义。

![](https://i.loli.net/2018/11/05/5be0059dbceea.jpg)



<font color="#dd0000">网络的数学名称是图</font>，在图论中对于每一个节点有一个重要概念，即：**度**。一个点的度是指图中该点所关联的边数。如下图，如果不加以思考，人们很容易认为生活中常见的网络会是一种random network，即每一个节点的度相对平均。然而第二种图，即scale-free network才是一种更稳定的选择。Scale-free network具有这样的特点，即存在少数节点具有明显高于一般点的度，这些点被称为hub。由少数hub与其它节点关联，最终构成整个网络。这样的网络的节点度数与具有该度数的节点个数间服从power distribution。这为我们寻找最佳参数提供了理论依据。     这里做一点扩展，我认为时非常有必要的。只要我们愿意抽象，Scale-free network大量存在于的生活中。人们的社交网络、生物基因蛋白质的相互作用、计算机网络甚至sexually transmitted diseases均有这层关系。生物体选择scale-free network而不是random network是有它进化上的原因的，显然对于scale-free network，少数关键基因执行着主要功能，这种网络具有非常好的鲁棒性，即只要保证hub的完整性，整个生命体系的基本活动在一定刺激影响下将不会受到太大影响，而random network若受到外界刺激，其受到的伤害程度将直接与刺激强度成正比。

 https://www.jianshu.com/p/a2790dc1f010



第二步通过基因之间的相关系数构建分层聚类树，**聚类树的不同分支代表不同的基因模块**，不同颜色代表不同的模块。基于基因的加权相关系数，将基因按照表达模式进行分类，将模式相似的基因归为一个模块。这样就可以将几万个基因通过基因表达模式被分成了几十个模块，是一个提取归纳信息的过程。

![](https://i.loli.net/2018/11/05/5be0062feeae6.jpg)

 

代码实现: [一文学会WGCNA分析](http://www.bio-info-trainee.com/2535.html)




 





