#  Gaussian Mixture Model

 漫谈 Clustering (3): Gaussian Mixture Model http://blog.pluskid.org/?p=39

GMM 和 K-means 的迭代求解法其实非常相似.因此也有和 K-means 同样的问题──并不能保证总是能取到全局最优，如果运气比较差，取到不好的初始值，就有可能得到很差的结果。对于 K-means 的情况，我们通常是重复一定次数然后取最好的结果，不过 GMM 每一次迭代的计算量比 K-means 要大许多，一个更流行的做法是先用 K-means （已经重复并取最优值了）得到一个粗略的结果，然后将其作为初值（只要将 K-means 所得的 centroids 传入 `gmm` 函数即可），再用 GMM 进行细致迭代。