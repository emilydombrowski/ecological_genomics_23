# script for BIOCLIM data

library(raster) # useful for spatial data
library(FactoMineR) # useful for principle components in R
library(factoextra)
library(corrplot) # useful for 

# contextualized on https://www.worldclim.org/data/worldclim21.html
# 19 climactic variables useful for summarizing the climate (mainly for terrestrial info)

setwd("~/Documents/UVM/ecological_genomics_23/PopGenomics/results/")

bioclim_list <- list.files("~/Documents/UVM/ecological_genomics_23/PopGenomics/results/wc10/", pattern=".bil",full.names=T)

bio <- raster::stack(bioclim_list)

# downloads bioclim variables at resolution of 10 arc minutes (coarsest res)

coords <- read.csv("https://www.uvm.edu/~kellrlab/forClass/colebrookSampleMetaData.csv", header=T)

# The chunk below refers to your bamlist file that you transferred during last week's PCA/admixture analysis.  
# It should be the same one you want to use here -- if your sample list for analysis changes in the future, you'll need a different bamlist!
  
names <- read.table("allRS_bam.list")
names <- unlist(strsplit(basename(as.character(names[,1])), split = ".sorted.rmdup.bam"))
split = strsplit(names, "_")
pops <- data.frame(names[1:95], do.call(rbind, split[1:95]))
names(pops) = c("Ind", "Pop", "Row", "Col")
# using BAM lists to get treenames from PCA; cleaned up version of bam list
# splits names by underscores

angsd_coords <- merge(pops, coords, by.x="Ind", by.y="Tree")
# merges cleaned up pops with meta data coords

points <- SpatialPoints(angsd_coords[c("Longitude","Latitude")])
# new variable based on lat and long fields in d

clim <- extract(bio,points)

angsd_coords_clim <- cbind.data.frame(angsd_coords,clim)
str(angsd_coords_clim)

# Make the climate PCA:

clim_PCA = PCA(angsd_coords_clim[,15:33], graph=T)

# Get a screeplot of cliamte PCA eigenvalues

fviz_eig(clim_PCA)

# What is the climate PCA space our red spruce pops occupy?

fviz_pca_biplot(clim_PCA, 
                geom.ind="point",
                col.ind = angsd_coords_clim$Latitude, 
                gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
                title="Climate PCA (Bioclim)",
                legend.title="Latitude")

# Which variables show the strongest correlation on the first 2 climate PC axes?

dimdesc(clim_PCA)[1:2]

# Replace "XX" with your bio variable most significant on climate PC1:

write.table(scale(angsd_coords_clim["bio13"]),
            "allRS_bio13.txt",
            sep="\t",
            quote=F,
            row.names = F,
            col.names=F)


# Replace "YY" with your bio variable most significant on climate PC2:  

write.table(scale(angsd_coords_clim["bio2"]),
            "allRS_bio2.txt",
            sep="\t",
            quote=F,
            row.names = F,
            col.names=F)