library(RcppCNPy)

setwd("~/Documents/UVM/ecological_genomics_23/PopGenomics/results/")

list.files()

# read in selection stats

s<-npyLoad("allRS_poly.selection.npy")

head(s)
dim(s)

pval <- as.data.frame(1-pchisq(s,1))
names(pval) = "p_PC1"
# creating a data frame that is looking at 1-the probability of chi square


dim(pval)

names(pval) = c("p_PC1", "p_PC2")

# associate theese p-values with the SNP meta data

p <- read.table("allRS_poly_mafs.sites",sep="\t",header=T, stringsAsFactors=T)
# tab delimited, strings as factors (interprets text as factor level)
dim(p)
# 593856 in this df compared to 461582 from selection stats
# if loci have knownEM <0.05, they were not kept. kept_sites 0 vs. 1 determines if they're kept or not

p_filtered = p[which(p$kept_sites==1),]
dim(p_filtered)
# filters out sites that are not kept; keeps meta data and relevant sites

# How many sites got filtered out when testing for selection? Why?

## make manhattan plot
plot(-log10(pval$p_PC1),
     col=p_filtered$chromo,
     xlab="Position",
     ylab="-log10(p-value)",
     main="Selection outliers: pcANGSD e=1 (K2)")

# super messy plot, it outputs very messy plot. Not organized into chromosomes

# We can zoom in if there's something interesting near a position...

plot(-log10(pval$p_PC1[2e05:2.01e05]),
     col=p_filtered$chromo, 
     xlab="Position", 
     ylab="-log10(p-value)", 
     main="Selection outliers: pcANGSD e=1 (K2)")

# get the contig with the lowest p-value for selection
sel_contig <- p_filtered[which(pval==min(pval$p_PC1)),c("chromo","position")]
sel_contig

cutoff=1e-4

outlier_contig <- p_filtered[which(pval$p_PC1<cutoff),c("chromo","position")]

outlier_contig <- outlier_contig[which(outlier_contig$position>0),]

dim(outlier_contig)

write.table(unique(outlier_contig$chromo),
            "allRS_poly_PC1_outlier_contigs.txt", 
            sep="\t", # tab delimited, easy for bash to read in
            quote=F, #gets rid of quotes
            row.names=F,# gets rid of row names
            col.names=F) # gets rid of column names