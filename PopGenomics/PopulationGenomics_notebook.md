# Population Genomics Lab Notebook

## Author: Emily Dombrowski
### Affiliation: University of Vermont, Dept. of Biology
### E-mail contact: emily.dombrowski@uvm.edu


### Start Date: 9-11-23
### End Date: in progress
### Project Descriptions: This notebook documents my workflow for bioinformatics in the Population Genomics section of my Ecological Genomics course.





# Table of Contents:   
* [Entry 1: 2023-09-11](#id-section1)
* [Entry 2: 2023-09-13](#id-section2)
* [Entry 3: 2023-09-18](#id-section3)
* [Entry 4: 2023-09-20](#id-section4)


------    
<div id='id-section1'/>   


### Entry 1: 2023-09-11.

- Data set about red spruce trees 
- Reviewed exome capture data
- Discussed the structure of fastq files (DNAseq + q scores)




------    
<div id='id-section2'/>   


### Entry 2: 2023-09-13.  

- After discussing FastQC results, we saw good quality sequence data for most of the read lenghts
- initial 5 bp had variable basepair and more variable bp frequencies, and the end of the reads had lower Q-scores
- Based on this, we used analysis to clean and trim the reads using  bash and 'fastp.sh' for this
- We used Bash and familiarized ourselves with VIM
- We looked at html files produced by 'fastp' and compared pre- and post-tirmming
- We ended the day by setting up mapping 


------    
<div id='id-section3'/>   


### Entry 3: 2023-09-18.

- class website tutorial: https://pespenilab.github.io/Ecological-Genomics/Fall2023/tutorials/2023-09-18_PopGenomics_Day3.html
- set up lab notebooks
- visualize sequence allignment files (.sam)
- process the mapping file .sam to bianry (*.bam)
- changed 'rm' function in bash: now, when deleting a file, a prompt will ask for clarification
- used vim to edit loop script for processing mapping files (.sam, then converting .sam to .bam)
- used tmux to create a screen for processing bash process_bams.sh command


------    
<div id='id-section4'/>   


### Entry 4: 2023-09-20.