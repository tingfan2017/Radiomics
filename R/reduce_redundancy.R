
# title: reduce_redundancy
# author: Tingfan
# date: 11/30/2021
# input: data of radiomics
# output: new data of after reduce redundancy



# reduce_redundancy
reduce_redundancy <- function (data, threshold = 0.9){

 # calculate p of normality test
 norm_result <- apply(data, 2, function(x) shapiro.test(x)$p.value)
 norm_feature <- data[which(norm_result >= 0.05)]

 # calculate r
 cor_nor = cor(norm_feature, method = "pearson")
 cor_all = cor(data, method = "spearman")

 # change
 num_nor <- dim(cor_nor)[1]
 cor_all[1:num_nor, 1:num_nor] <- cor_nor

 # set
 cor_all[upper.tri(cor_all)] = 0
 diag(cor_all) = 0

 # selection
 data.final = data[, !apply(cor_all, 2, function(x) any(abs(x) > threshold))]

 # outcome
 return(data.final)

}























