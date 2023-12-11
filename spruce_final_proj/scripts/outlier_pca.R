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
w <- npyLoad("RS_mapped_poly.weights.npy")
weight <- as.data.frame(w)

names(weight) = c("w_PC1","w_PC2") # how do I reassign column names?
dim(weight) # [1] 507966      2
head(weight)
names(weight)

p <- read.table("RS_mapped_poly_mafs.sites",sep="\t",header=T, stringsAsFactors=T)
dim(p) # [1] 680688      8

p_filtered = p[which(p$kept_sites==1),]
dim(p_filtered) # [1] 507966      8

s<-npyLoad("RS_mapped_poly.selection.npy")

# convert test statistic to p-value
pval <- as.data.frame(1-pchisq(s,1))
names(pval) = c("p_PC1","p_PC2")

## merge pc weights with p value df 
pc_weights <- cbind(p_filtered, weight)
# make a new column for color...black is the default color
pc_weights$color="darkred"
pc_weights$color[pc_weights$w_PC1>=0]="black"
pc_weights$color[pc_weights$w_PC1<=0]="darkred"
pc_weights$out="black"
pc_weights$out[pc_weights$p_PC1>=0.0005]="black"
pc_weights$out[pc_weights$p_PC1<=0.0005]="darkred"
dim(pc_weights)
head(pc_weights)


## make 'manhattan' plot
plot(pc_weights$w_PC1,
     col=pc_weights$chromo,
     xlab="Position",
     ylab="PC1 Loading",
     main="Principal component loading along PC1: pcANGSD e=2 (K3)",
     cex=0.3)

# plot(x=pc_weights$position, y=pc_weights$w_PC1,
#      xlab="Position",
#      ylab="PC1 Loading",
#      main="Principal component loading along PC1: pcANGSD e=2 (K3)",
#      cex=0.3)

# plot(pc_weights$w_PC1[2.535e05:2.545e05],
#      col=pc_weights$chromo,
#      xlab="Position",
#      ylab="PC1 Loading",
#      main="Principal component loading along PC1: pcANGSD e=2 (K3)",
#      cex=0.3)
# 
# plot(pc_weights$knownEM[253500:254500])

plot(x=pc_weights$knownEM,
     y=pc_weights$w_PC1,
     col=p_filtered$chromo)   

plot(x=pc_weights$w_PC1,
     y=pc_weights$position,
     xlab="PC1 Loadings",
     ylab="Position in Genome",
     col=pc_weights$color,
     cex=0.5)
     
plot(pc_weights$w_PC1,
     col=pc_weights$color)

plot(weight[253950:254050,1])

pc_weights[253970:254000,]

plot(x=pc_weights$w_PC1[253500:254500], y=pc_weights$knownEM[253500:254500])

plot(x=p_filtered$chromo, y=weight$w_PC1)

plot(pc_weights$w_PC1)


library(dplyr)

cutoff=0.0005   # equals a 1 in 5,000 probability
outlier_contigs_wPC1 <- pc_weights[which(pval$p_PC1<cutoff),c("chromo","position", "major", "minor", "ref", "anc", "knownEM", "w_PC1", "color")]
rs_outlier_contigs <- filter(outlier_contigs_wPC1, color=="darkred")
bs_outlier_contigs <- filter(outlier_contigs_wPC1, color=="black")
# write_csv(rs_outlier_contigs, file="outlier_contigs_PC1_NS.csv")
# write_csv(bs_outlier_contigs, file="outlier_contigs_PC1_BS.csv")

plot(x = outlier_contigs_wPC1$w_PC1, y = outlier_contigs_wPC1$position,
     col = outlier_contigs_wPC1$color,
     main = "Outlier Loci PC Loadings",
     xlab = "PC Loadings",
     ylab = "Position")

plot(x = outlier_contigs_wPC1$w_PC1, y = outlier_contigs_wPC1$position,
     col = outlier_contigs_wPC1$color)

plot(x = outlier_contigs_wPC1$w_PC1, y = outlier_contigs_wPC1$knownEM,
     main = "Outlier Loci PC Loadings (n=36)",
     xlab = "PC Loadings",
     ylab = "Allele frequency",
     col = outlier_contigs_wPC1$color,
     pch=19)
legend(x = "topright", box.col = "black", 
       bg ="white", box.lwd = 2 ,  
       legend=c("Red Spruce (n=22)", "Black Spruce (n=14)"),  
       fill = c("darkred","black")) 

library(janitor)
tabyl(outlier_contigs_wPC1, color)
# color  n   percent
# black 14 0.3888889
# darkred 22 0.6111111
# chi square statistic = 0.184
# not significantly different than expected , statistically different 
# not indicating either reproductive isolation nor adaptive introgression


write.table(unique(rs_outlier_contigs$chromo),
            "RS_PC1_outlier_contigs.txt", 
            sep="\t",
            quote=F,
            row.names=F,
            col.names=F)

write.table(unique(bs_outlier_contigs$chromo),
            "BS_PC1_outlier_contigs.txt", 
            sep="\t",
            quote=F,
            row.names=F,
            col.names=F)
