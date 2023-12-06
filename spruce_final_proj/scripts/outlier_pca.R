##########
# Outlier contig plots

# The purpose of this script is to make a plots with RS and BS that shows
# associations with outlier contigs

##########

library(RcppCNPy) # for reading python numpy (.npy) files
library(ggplot2) # plotting
library(ggpubr) # plotting
library(tidyverse) # data cleaning

#### Load in data frames
w <- npyLoad("RSBS_poly.weights.npy")
weight <- as.data.frame(w)

names(weight) = c("w_PC1","w_PC2") # how do I reassign column names?
dim(weight) # [1] 507966      2
head(weight)
names(weight)

p <- read.table("RSBS_poly_mafs.sites",sep="\t",header=T, stringsAsFactors=T)
dim(p) # [1] 680688      8

p_filtered = p[which(p$kept_sites==1),]
dim(p_filtered) # [1] 507966      8


s<-npyLoad("RSBS_poly.selection.npy")

# convert test statistic to p-value
pval <- as.data.frame(1-pchisq(s,1))
names(pval) = c("p_PC1","p_PC2")

## merge pc weights with p value df 
pc_weights <- cbind(p_filtered, weight)
dim(pc_weights)
head(pc_weights)

## make 'manhattan' plot
plot(pc_weights$w_PC1,
     col=pc_weights$chromo,
     xlab="Position",
     ylab="PC1 Loading",
     main="Principal component loading along PC1: pcANGSD e=2 (K3)",
     cex=0.3)

plot(pc_weights$w_PC1[2.535e05:2.545e05],
     col=pc_weights$chromo,
     xlab="Position",
     ylab="PC1 Loading",
     main="Principal component loading along PC1: pcANGSD e=2 (K3)",
     cex=0.3)

plot(pc_weights$knownEM[253500:254500])
     
     
plot(weight[253950:254050,1])

pc_weights[253970:254000,]

plot(x=pc_weights$w_PC1[253500:254500], y=pc_weights$knownEM[253500:254500])

plot(x=p_filtered$chromo, y=weight$w_PC1)

cutoff=0.0005   # equals a 1 in 5,000 probability
outlier_contigs_wPC1 <- pc_weights[which(pc_weights$p_PC1<cutoff),c("chromo","position", "major", "minor", "ref", "anc", "w_PC1")]
