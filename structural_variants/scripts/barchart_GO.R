
go <- read.csv("~/Documents/UVM/ecological_genomics_23/structural_variants/data/go_ontology.csv")

library(ggplot2)

ggplot(go, aes(x=reorder(go_class, -num_genes), y=num_genes)) +
 geom_bar(position="dodge", stat="identity") + 
  geom_text(aes(label=num_genes), vjust=-0.2) +
  xlab("GO Category") + ylab("Number of Genes") +
  theme(axis.text.x = element_text(angle=15, hjust=1)) +
  theme(panel.background = element_blank()) 
