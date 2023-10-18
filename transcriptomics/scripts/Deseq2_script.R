# set working directory
setwd("~/Documents/UVM/ecological_genomics_23/transcriptomics/results")

library(DESeq2)
library(dplyr)
library(tidyr)
library(ggplot2)
library(scales)
library(ggpubr)
library(wesanderson)
library(vsn)
library(hexbin)
#BiocManager::install("DESeq2")
# First: BiocManager::install("vsn") AND BiocManager::install("hexbin")
