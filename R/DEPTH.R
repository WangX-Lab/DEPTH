
#' @title Evaluation of the tumor heterogeneity level.
#'
#' @description
#' \code{DEPTH} DEPTH evaluates the tumor heterogeneity level of each tumor sample based on gene expression profiles Heterogeneity score vignette.
#'
#' @details
#' DEPTH evaluates the tumor heterogeneity level of each tumor sample based on gene expression profiles.
#'
#' @param exp gene expression profiles in both tumor and normal samples (microarray or RNA-Seq data, log2 transformed is recommended).
#' DEPTH function support 2 kind of datasets:
#' 1) if the "exp" dataset has normal samples and tumor samples, we can caculate the heterogeneity score with both normal samples and tumor samples.
#' 2) else if the "exp" dataset only has tumor samples, we can caculate the heterogeneity score by with tumor samples.
#' @param match samples in "exp" denoted by "Tumor" or "Normal".
#' @export
#'
#' @importFrom stats sd
#' @return A matrix with 2 columns:
#' \item{Sample}{Tumor samples to be predicted.}
#' \item{heterogeneity score}{The heterogeneity score of each sample.}
#' @author Xiaosheng Wang <xiaosheng.wang@@cpu.edu.cn>
DEPTH <- function(exp, match)
{#Two files need to be input into this function.
  exp<-as.data.frame(exp)
  match <- as.data.frame(match)

  pos_nor <- which(colnames(exp) %in% match[which(match[, 2] == "Normal"), 1])
  pos_dis <- which(colnames(exp) %in% match[which(match[, 2] == "Tumor"), 1])

  exp_nor <- exp[, pos_nor]
  exp_dis <- exp[, pos_dis]

  #Caculate the average values of each gene in normal/disease sample.
  mean_nor <- as.data.frame(rowMeans(exp_nor,na.rm=T))
  mean_dis <- as.data.frame(rowMeans(exp_dis,na.rm=T))

  score <- as.data.frame(matrix(0, nrow <- dim(exp_dis)[1], ncol <- dim(exp_dis)[2]))
  #Caculate the heterogeneity score of each gene.
  if(length(pos_nor) > 0){
    for(u in 1 : dim(exp_dis)[2]){
      score[,u] <- (exp_dis[,u] - mean_nor[,1])^2
    }
  }else if(length(pos_nor) == 0){
    for(u in 1 : dim(exp_dis)[2]){
      score[,u] <- (exp_dis[,u] - mean_dis[,1])^2
    }
  }

  colnames(score) <- colnames(exp_dis)
  rownames(score) <- rownames(exp_dis)

  heterogeneity_score <- c()

  for(z in 1:length(colnames(exp_dis))){
    heterogeneity_score[z] <- sd(score[, z],na.rm=T)
  }
  heterogeneity_score <- cbind(colnames(exp_dis), heterogeneity_score)
  #Caculate the heterogeneity score of each sample.
  colnames(heterogeneity_score) <- c("Sample", "ITH score")
  #DEPTH function will output the heterogeneity score of each tumor sample.
  return(heterogeneity_score)
}
