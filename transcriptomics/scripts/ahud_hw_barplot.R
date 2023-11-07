# script to make a column graph for WGCNA modules

setwd("~/Documents/UVM/ecological_genomics_23/transcriptomics/results")

dat <- read.csv("~/Documents/UVM/ecological_genomics_23/transcriptomics/results/wgcna_mod_3.csv")

library(ggplot2)
library(dplyr)
library(plotly)

ggplot(dat, aes(fill=condition, x=color, y=number_genes))  + 
  geom_bar(position="dodge", stat="identity") + 
  xlab("Module Color") + ylab("Number of Genes") +
  theme(axis.text.x = element_text(angle=45, vjust=1, hjust=1)) +
  theme(panel.background = element_blank()) + 
  geom_text(aes(label = number_genes), vjust = 1, angle = 90, colour = "black")

ggplot(dat, aes(fill=color, x=condition, y=number_genes))  + 
  geom_bar(position="stack", stat="identity") + 
  xlab("Module Color") + ylab("Number of Genes") +
  theme(axis.text.x = element_text(angle=45, vjust=1, hjust=1)) +
  theme(panel.background = element_blank())