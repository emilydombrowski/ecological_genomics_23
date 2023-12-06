##########
# Outlier contig PCA

# The purpose of this script is to make a PCA with RS and BS that shows
# associations with outlier contigs

##########

# load libraries
library(ggplot2) # plotting
library(ggpubr) # plotting
library(RcppCNPy) # reads nmpy files

COV <- as.matrix(read.table("RSBS_poly_k4.cov")) # read in the genetic covariance matrix

PCA <- eigen(COV) # extract the principal components from the COV matrix

COV <- as.matrix(read.table("RSBS_poly_k4.cov")) # read in the genetic covariance matrix

PCA <- eigen(COV) # extract the principal components from the COV matrix

## How much variance is explained by the first few PCs?

var <- round(PCA$values/sum(PCA$values),3)

var[1:3]

# A "screeplot" of the eigenvalues of the PCA:

barplot(var, 
        xlab="Eigenvalues of the PCA", 
        ylab="Proportion of variance explained")

## Bring in the bam.list file and extract the sample info:

names <- read.table("RSBS_bam_k4.list")
names <- unlist(strsplit(basename(as.character(names[,1])), split = ".sorted.rmdup.bam"))
split = strsplit(names, "_")
pops <- data.frame(names[1:113], do.call(rbind, split[1:113]))
names(pops) = c("Ind", "Pop", "Row", "Col")

## A PCA plot using ggplot :)

data=as.data.frame(PCA$vectors)
data=data[,c(1:3)]
data= cbind(data, pops)

cols=c("#377eB8","#EE9B00","#0A9396","#94D2BD","#FFCB69","#005f73","#E26D5C","#AE2012", "#6d597a", "#7EA16B","#d4e09b", "gray70", "cyan", "coral", "blue", "darkgrey")

ggscatter(data, x = "V1", y = "V2",
          color = "Pop") +
  theme_bw(base_size = 13, base_family = "Times") +
  theme(panel.background = element_blank(), 
        legend.background = element_blank(), 
        panel.grid = element_blank(), 
        plot.background = element_blank(), 
        legend.text=element_text(size=rel(.7)), 
        axis.text = element_text(size=13), 
        legend.position = "bottom") +
  labs(x = paste0("PC1: (",var[1]*100,"%)"), y = paste0("PC2: (",var[2]*100,"%)")) +
  scale_color_manual(values=c(cols), name="Source population") +
  guides(colour = guide_legend(nrow = 2))


### Load in PCA values that generate PCs

s<-npyLoad("RSBS_poly.selection.npy")

pval <- as.data.frame(1-pchisq(s,1))
names(pval) = c("p_PC1","p_PC2")

# convert test statistic to p-value
pval <- as.data.frame(1-pchisq(s,1))
names(pval) = c("p_PC1","p_PC2")

## read positions
p <- read.table("RSBS_poly_mafs.sites",sep="\t",header=T, stringsAsFactors=T)
dim(p) #680688      8

p_filtered = p[which(p$kept_sites==1),]
dim(p_filtered) # [1] 507966      8

pc_pval <- cbind(p_filtered, pval)
# merges df
outlier_contigs_PC1_pval <- pc_pval[which(pval$p_PC1<cutoff),
                                    c("chromo","position", "major", "minor", "ref", "anc", "p_PC1")]
