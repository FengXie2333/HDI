## 使用cgdsr下载cBioPortal数据

~~~R
library(cgdsr)

mycgds = CGDS("http://www.cbioportal.org/")

class(mycgds)

tt <- getCancerStudies(mycgds)

tt[which(tt$name == 'Breast Invasive Carcinoma (TCGA, PanCancer Atlas)'),]

study_id <- tt[which(tt$name == 'Breast Invasive Carcinoma (TCGA, PanCancer Atlas)'),][,c(1,2)]

profiles <- getGeneticProfiles(mycgds, study_id$cancer_study_id)

cases <- getCaseLists(mycgds, study_id$cancer_study_id)
~~~

