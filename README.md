# DEPTH
DEPTH evaluates the intratumor heterogeneity (ITH) level of each tumor sample based on gene expression profiles

Cite the code: [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4094813.svg)](https://doi.org/10.5281/zenodo.3968541)

# DEPTH

DEPTH evaluates the ITH level of each tumor sample based on its gene expression profiles


## Description

This vignette shows an example of how to use the DEPTH algorithm to calculate the ITH score in R. 

DEPTH is an algorithm to score ITH at the mRNA level.


## Details

### Input: two files needed for the DEPTH function: 

1) **exp:** gene expression profiles in tumor and/or normal samples (microarray or RNA-Seq data, normalized). **Note**: when reading the input file, please set "row.names=1".   


                                  Table 1. mRNA expression of input data

||TCGA-A6-2671-11A-01R-A32Z-07|TCGA-A6-2675-11A-01R-1723-07|TCGA-A6-2675-01A-02R-1723-07|
| :-----: | :------: | :------: | :-----: |
| SKAP1 |  6.22  |  4.36  |  6.00 |
|TPSB2|9.39|9.45|9.21|
|PLXNB3|6.09|8.45|4.95|
|VAT1L|7.45|7.76|6.13|
|VIP|9.43|10.99|7.71|
|WNT5B|7.52|7.80|6.29|
|ZAP70|6.43|5.13|5.94|
|TNFRSF10C|3.67|3.90|5.46|
|ZNF167|4.46|6.10|5.88
|KIF26B|3.62|4.61|7.68|
|STRA6|2.26|1.08|6.57|


2) **match**: sample type ("tumor" or "normal") in "exp". **Note**: when normal controls are not available, please change "Normal" into "Tumor", namely, all values in the "state" column are "Tumor". 
 
 
 Table2. Identification of tumor and normal samples 

|State|Identification|
| :-----: | :-----: | 
|TCGA-A6-2671-11A-01R-A32Z-07|Normal
|TCGA-A6-2675-11A-01R-1723-07|Normal
|TCGA-A6-2675-01A-02R-1723-07|Normal
|TCGA-A6-2678-11A-01R-A32Z-07|Normal
|TCGA-A6-2679-11A-01R-A32Z-07|Normal
|TCGA-A6-2680-11A-01R-A32Z-07|Normal
|TCGA-A6-2682-11A-01R-A32Z-07|Normal
|TCGA-A6-2682-01A-01R-1410-07|Tumor


**Table 1** is an example of **"exp"**, and **Table 2** is an example of **"match"**.  

Example **"exp"**: gene expression profiles in cholangiocarcinoma from the genomic data commons data portal (https://portal.gdc.cancer.gov/). There are 45 samples (36 tumor and 9 normal samples) and 20,531 genes in **"exp"**. The DEPTH function will output the ITH score for each of the 36 tumor samples as shown in **Table 3**.  


 Table 3. ITH score of tumor samples in output data 

|Sample|ITH score|
| :-----: | :-----: | 
|TCGA-A6-2675-01A-02R-1723-07|2.9543|
|TCGA-A6-2682-01A-01R-1410-07|4.3075|
|TCGA-A6-2684-01A-01R-1410-07|3.9165|
|TCGA-A6-2685-01A-01R-1410-07|2.8586|


## Installation
Users can install the released version of ‘DEPTH’ with:

```  
if (!requireNamespace("devtools", quietly = TRUE))
    install.packages("devtools")
    
devtools::install_github("WangX-Lab/DEPTH/DEPTH")
```

## Example

```  
exp=read.csv("DEPTH/exp.csv",row.names=1)
match=read.csv("DEPTH/match.csv")

library(DEPTH)
DEPTH(exp, match) 
```


## Citation

Mengyuan Li, Zhilan Zhang, Lin Li, Xiaosheng Wang. An algorithm to quantify intratumor heterogeneity based on alterations of gene expression profiles. Communications Biology 2020, 3(1), 505. DOI: https://doi.org/10.1038/s42003-020-01230-7.
