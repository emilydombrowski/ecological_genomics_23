###################################
#  Selection scans for red spruce #
###################################
# Developed by Steve Keller, script executed by Gwen Ellis
# modifications made by E. Dombrowski to export a data frame for PCA

library(RcppCNPy) # for reading python numpy (.npy) files


### read in selection statistics (these are chi^2 distributed)
s<-npyLoad("RSBS_poly.selection.npy")

# convert test statistic to p-value
pval <- as.data.frame(1-pchisq(s,1))
names(pval) = c("p_PC1","p_PC2")

## read positions
p <- read.table("RSBS_poly_mafs.sites",sep="\t",header=T, stringsAsFactors=T)
dim(p) #680688      8

p_filtered = p[which(p$kept_sites==1),]
dim(p_filtered) # [1] 507966      8

# How many sites got filtered out when testing for selection? Why?

## make manhattan plot
plot(-log10(pval$p_PC1),
     col=p_filtered$chromo,
     xlab="Position",
     ylab="-log10(p-value)",
     main="Selection outliers: pcANGSD e=2 (K3)",
     cex=0.3)

# We can zoom in if there's something interesting near a position...

plot(-log10(pval$p_PC1[2e05:2.01e05]),
     col=p_filtered$chromo, 
     xlab="Position", 
     ylab="-log10(p-value)", 
     main="Selection outliers: pcANGSD e=2 (K3)")

# get the contig with the lowest p-value for selection
sel_contig <- p_filtered[which(pval$p_PC1==min(pval$p_PC1)),c("chromo","position")]
sel_contig

# get all the outliers with p-values below some cutoff
cutoff=0.0005   # equals a 1 in 5,000 probability
outlier_contigs_PC1 <- p_filtered[which(pval$p_PC1<cutoff),c("chromo","position", "major", "minor", "ref", "anc", "p_PC1")]
outlier_contigs_PC2 <- p_filtered[which(pval$p_PC2<cutoff),c("chromo","position")]

# how many outlier loci < the cutoff?
dim(outlier_contigs_PC1)[1]
dim(outlier_contigs_PC2)[1]

# how many unique contigs harbor outlier loci?
length(unique(outlier_contigs_PC2$chromo)) #1146

head(pval$p_PC1)
pval_PC1 <- p_filtered[which(pval_PC1<cutoff)]

pc_pval <- cbind(p_filtered, pval)
# merges df
outlier_contigs_PC1_pval <- pc_pval[which(pval$p_PC1<cutoff),c("chromo","position", "major", "minor", "ref", "anc", "p_PC1")]
