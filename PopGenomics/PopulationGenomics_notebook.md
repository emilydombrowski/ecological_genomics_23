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
* [Entry 5: 2023-09-25](#id-section5)
* [Entry 5: 2023-09-27](#id-section6)


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

- Class website tutorial:
https://pespenilab.github.io/Ecological-Genomics/Fall2023/tutorials/2023-09-20_PopGenomics_Day4.html
- finishing bam_stats.sh loop + investigating output
- read 2 usually has lower p-scores that are trimmed down due to Q scores
- outputs coverage depths of organisms; higher coverage is important in determining hetero- vs. homozygosity, allelic frequencies, etc.
- system assigns genotype frequency to estimate average chance of allelic position 
- ANGSD: useful for low reads to estimate genotype likelyhood
- User guide: (work in progress)
http://www.popgen.dk/angsd/index.php/ANGSD
- Created angsd.sh file in VIM
- filepath: /netfiles/ecogen/PopulationGenomics/fastq/red_spruce/cleanreads/bam
- File is stored in =~myresults/ANGSD
- If there is a ~, putting quotes around the file name won't allow recognition
- started running ANGSD on tmux before leaving class

------    
<div id='id-section5'/>   


### Entry 5: 2023-09-25.

-Followed tutorial on https://pespenilab.github.io/Ecological-Genomics/Fall2023/tutorials/2023-09-25_PopGenomics_Day5.html
-Ran bash scripts for estimating Site Frequency Spectrum (SFS)
- Used vim to make a loop that estimated theta stats
- work in R script: titled "2032.thetas.R", saved to "~/Documents/UVM/ecological_genomics_23/PopGenomics/scripts/"

------    
<div id='id-section6'/>   


### Entry 6: 2023-09-27.
-class script: https://pespenilab.github.io/Ecological-Genomics/Fall2023/tutorials/2023-09-27_PopGenomics_Day6.html
-Created vim script to calculate Fst using ANGSD between "MYPOP" and black spruce...file named ANGSD_Fst.sh
-Using PCAngsd in bash (step 3 on tutorial)
  -created vim file named pcANGSD_allRS_poly.sh to ANGSD folder
  -looking at all redspruce (allrs) polymorphic types (poly)
-transferred files with filezilla
  
-Notes from class:
-Saved to ~/myresults/ANGSD
- Fst = (var(p)/mean(p)*mean(q))
  -humans: Fst=0.05
  -urchins: Fst<0.01
  -large vertebrates: 0.1
  -between sister taxa: 0.1-0.2
-Tajima's d: 0-value represents population at equilibrium...hasn't been growing or shrinking...
  -if this distribution shifts from 0 to positive, it signifies a loss of rare alleles (shrinking population)
  -shifts from 0 to negative, it signifies an abundance of rare alleles (high mutation rate; population increase or expansion)
  -in this study, southern populations are shrinking while northern population is growing (expected)
-Calculate Fst: Ne=Theta/(4mu)