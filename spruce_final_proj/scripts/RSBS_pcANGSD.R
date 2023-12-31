# pcANGSD results for red and black spruce introgression

library(ggplot2) # plotting
library(ggpubr) # plotting

## First, let's work on the genetic PCA:

COV <- as.matrix(read.table("BS_mapped_poly_e2.cov")) # read in the genetic covariance matrix

PCA <- eigen(COV) # extract the principal components from the COV matrix

## How much variance is explained by the first few PCs?

var <- round(PCA$values/sum(PCA$values),3)

var[1:3]

# A "screeplot" of the eigenvalues of the PCA:

barplot(var, 
        xlab="Eigenvalues of the PCA", 
        ylab="Proportion of variance explained")

## Bring in the bam.list file and extract the sample info:

names <- read.table("BS_mapped_bam.list")
names <- unlist(strsplit(basename(as.character(names[,1])), split = ".sorted.rmdup.bam"))
split = strsplit(names, "_")
pops <- data.frame(names[1:113], do.call(rbind, split[1:113]))
names(pops) = c("Ind", "Pop", "Row", "Col")

## A quick and humble PCA plot:

plot(PCA$vectors[,1:2],
     col=as.factor(pops[,2]),
     xlab="PC1",ylab="PC2", 
     main="Genetic PCA")

## A more beautiful PCA plot using ggplot :)

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

## Next, we can look at the admixture clustering:

# import the ancestry scores (these are the .Q files)

q <- read.table("BS_mapped_poly.admix.3.Q", sep=" ", header=F)

dim(q)

K=dim(q)[2] #Find the level of K modeled

dim(q)[2]

## order according to population code
ord<-order(pops[,2])

# make the plot:
barplot(t(q)[,ord],
        col=cols[1:K],
        space=0,border=NA,
        xlab="Populations",ylab="Admixture proportions",
        main=paste0("Red spruce K=",K))
text(tapply(1:nrow(pops),pops[ord,2],mean),-0.05,unique(pops[ord,2]),xpd=T)
abline(v=cumsum(sapply(unique(pops[ord,2]),function(x){sum(pops[ord,2]==x)})),col=1,lwd=1.2)

# MN1, MN2, and WISC populations are BS
# visible in admixture and PCA plots. Potentially interesting to evaluate with different eigenvectors