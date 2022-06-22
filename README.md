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

|          | TCGA-4G-AAZT-01A-11R-A41I-07 | TCGA-W5-AA30-01A-31R-A41I-07 | TCGA-W5-AA33-01A-11R-A41I-07 |
| :------: | :--------------------------: | :--------------------------: | :--------------------------: |
|  TSPAN6  |            12.87             |            12.32             |            13.47             |
|   DPM1   |            10.13             |            10.68             |             9.92             |
|  SCYL3   |             8.23             |            11.14             |            10.34             |
| C1orf112 |             6.17             |             9.84             |             8.45             |
|   FGR    |             7.99             |             8.55             |             9.39             |
|   CFH    |            13.01             |            11.70             |            13.74             |
|  FUCA2   |            10.82             |            11.07             |            10.95             |
|   GCLC   |             9.58             |            11.46             |            11.13             |
|   NFYA   |             8.93             |            10.78             |            10.56             |
|  STPG1   |             8.52             |             8.55             |             8.64             |
|  NIPAL3  |             9.27             |            10.15             |            10.60             |


2) **match**: sample type ("tumor" or "normal") in "exp". **Note**: when normal controls are not available, please change "Normal" into "Tumor", namely, all values in the "state" column are "Tumor". 


 Table2. Identification of tumor and normal samples 

|State|Identification|
| :-----: | :-----: | 
|TCGA-4G-AAZT-01A-11R-A41I-07|Tumor
|TCGA-W5-AA30-01A-31R-A41I-07|Tumor
|TCGA-W5-AA33-01A-11R-A41I-07|Tumor
|TCGA-W5-AA38-01A-11R-A41I-07|Tumor
|TCGA-3X-AAVC-01A-21R-A41I-07|Tumor
|TCGA-W5-AA2Q-11A-11R-A41I-07|Normal
|TCGA-W5-AA31-11A-11R-A41I-07|Normal
|TCGA-W5-AA2I-01A-32R-A41I-07|Tumor


**Table 1** is an example of **"exp"**, and **Table 2** is an example of **"match"**.  

Example **"exp"**: gene expression profiles in cholangiocarcinoma from the genomic data commons data portal (https://portal.gdc.cancer.gov/). There are 45 samples (36 tumor and 9 normal samples) and 20,531 genes in **"exp"**. The DEPTH function will output the ITH score for each of the 36 tumor samples as shown in **Table 3**.  


 Table 3. ITH score of tumor samples in output data 

|            Sample            | ITH score |
| :--------------------------: | :-------: |
| TCGA-4G-AAZT-01A-11R-A41I-07 |  13.1368  |
| TCGA-W5-AA30-01A-31R-A41I-07 |  13.2092  |
| TCGA-W5-AA33-01A-11R-A41I-07 |  7.8975   |
| TCGA-W5-AA38-01A-11R-A41I-07 |  14.1650  |


## Installation

Users can install the released version of ‘DEPTH’ with:

```  
if (!requireNamespace("devtools", quietly = TRUE))
    install.packages("devtools")
    
devtools::install_github("WangX-Lab/DEPTH")
```

## Example

```  
load(system.file("data/TCGA-CHOLexp.Rdata",package = "DEPTH"))
load(system.file("data/TCGA-CHOLtype.Rdata",package = "DEPTH"))

library(DEPTH)
DEPTH(mRNA_exp, stype) 
```


## Citation

1. Mengyuan Li, Zhilan Zhang, Lin Li, Xiaosheng Wang. An algorithm to quantify intratumor heterogeneity based on alterations of gene expression profiles. Communications Biology 2020, 3(1), 505. DOI: https://doi.org/10.1038/s42003-020-01230-7.
2. Li, M., Zhang, Z., Li, L. et al. Author Correction: An algorithm to quantify intratumor heterogeneity based on alterations of gene expression profiles. Commun Biol 5, 323 (2022). https://doi.org/10.1038/s42003-022-03285-0.

### Contact

E-mail any questions to Xiaosheng Wang <<xiaosheng.wang@cpu.edu.cn>>
## Citation

1. Mengyuan Li, Zhilan Zhang, Lin Li, Xiaosheng Wang. An algorithm to quantify intratumor heterogeneity based on alterations of gene expression profiles. Communications Biology 2020, 3(1), 505. DOI: https://doi.org/10.1038/s42003-020-01230-7.
2. Li, M., Zhang, Z., Li, L. et al. Author Correction: An algorithm to quantify intratumor heterogeneity based on alterations of gene expression profiles. Commun Biol 5, 323 (2022). https://doi.org/10.1038/s42003-022-03285-0.

### Contact

E-mail any questions to Xiaosheng Wang <<xiaosheng.wang@cpu.edu.cn>>
