
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
  exp <- as.matrix(exp);
  gene <- exp[-1, 1];
  samp <- exp[1, -1];
  exp <- as.matrix(exp[-1, -1]);
  colnames(exp) <- samp;
  rownames(exp) <- gene;
  match <- as.matrix(match);
  #Pick up normal samples.
  nor_pos <- which(samp %in% match[which(match[, 2] == "Normal"), 1])
  #Pick up tumor samples.
  tum_pos <- which(samp %in% match[which(match[, 2] == "Tumor"), 1])
  exp_tum <- exp[, tum_pos]; samp_tum <- samp[tum_pos];
  score <- matrix(0, nrow <- dim(exp_tum)[1], ncol <- dim(exp_tum)[2])

  if(length(nor_pos) > 0){
    nor <- c();
    for(j in 1:dim(exp)[1]){
      nor[j] <- mean(as.numeric(exp[j, nor_pos]))
    }#Caculate the average values of each gene in normal sample.
    #Caculate the heterogeneity score of each gene.
    for(s in 1 : dim(exp_tum)[1]){
      for(u in 1 : dim(exp_tum)[2]){
        score[s, u] <- (as.numeric(exp_tum[s, u]) - as.numeric(nor[s]))^2
      }
    }
  }else if(length(nor_pos)==0){
    for(s in 1 : dim(exp_tum)[1]){
      for(u in 1 : dim(exp_tum)[2]){
        score[s, u] <- (as.numeric(exp_tum[s, u]) - mean(as.numeric(exp_tum[s, ])))^2
      }
    }
  }
  colnames(score) <- samp_tum; rownames(score) <- gene;
  heterogeneity_score <- c();
  for(z in 1:length(samp_tum)){
    heterogeneity_score[z] <- sd(as.numeric(score[, z]))
  }
  heterogeneity_score <- cbind(samp_tum, heterogeneity_score);
  #caculate the heterogeneity score of each sample.
  colnames(heterogeneity_score) <- c("sample", "heterogeneity score")
  #DEPTH function will output the heterogeneity score of each tumor sample.
  return(heterogeneity_score)
}
