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
* [Entry 6: 2023-09-27](#id-section6)
* [Entry 7: 2023-10-02](#id-section7)
* [Entry 8: 2023-10-04](#id-section8)
* [Entry 9: 2023-10-09](#id-section9)
* [Entry 10: 2023-10-11](#id-section10)
* [Entry 11: 2023-10-16](#id-section11)
* [Entry 12: 2023-10-18](#id-section12)
* [Entry 13: 2023-10-23](#id-section13)
* [Entry 14: 2023-10-25](#id-section14)
* [Entry 15: 2023-10-30](#id-section15)


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

- Followed tutorial on https://pespenilab.github.io/Ecological-Genomics/Fall2023/tutorials/2023-09-25_PopGenomics_Day5.html
- Ran bash scripts for estimating Site Frequency Spectrum (SFS)
- Used vim to make a loop that estimated theta stats
- work in R script: titled "2032.thetas.R", saved to "~/Documents/UVM/ecological_genomics_23/PopGenomics/scripts/"

------    
<div id='id-section6'/>   


### Entry 6: 2023-09-27.
- class script: https://pespenilab.github.io/Ecological-Genomics/Fall2023/tutorials/2023-09-27_PopGenomics_Day6.html
- Created vim script to calculate Fst using ANGSD between "MYPOP" and black spruce...file named ANGSD_Fst.sh
- Using PCAngsd in bash (step 3 on tutorial)
  - created vim file named pcANGSD_allRS_poly.sh to ANGSD folder
  - looking at all redspruce (allrs) polymorphic types (poly)
- transferred files with filezilla
  
- Notes from class:
- Saved to ~/myresults/ANGSD
- Fst = (var(p)/mean(p)*mean(q))
  - humans: Fst=0.05
  - urchins: Fst<0.01
  - large vertebrates: 0.1
  - between sister taxa: 0.1-0.2
- Tajima's d: 0-value represents population at equilibrium...hasn't been growing or shrinking...
  - if this distribution shifts from 0 to positive, it signifies a loss of rare alleles (shrinking population)
  - shifts from 0 to negative, it signifies an abundance of rare alleles (high mutation rate; population increase or expansion)
  - in this study, southern populations are shrinking while northern population is growing (expected)
- Calculate Ne: Ne=Theta/(4*2.5E-10)

------
<div id='id-section7'/>   


### Entry 7: 2023-10-02.

- class tutorial: https://pespenilab.github.io/Ecological-Genomics/Fall2023/tutorials/2023-10-02_PopGenomics_Day7.1.html
- updated Fst values in google sheet 
- discussed PCA and Admixture plots
  - complimentary to one another! PCA1 may be related to admixture, hybridization, etc.
- created ANGSD file for processing population divergence
- saved new r script titled "outlier_contigs_scripts.R"
  - file path: ~/Documents/UVM/ecological_genomics_23/PopGenomics/scripts/outlier_contigs_scripts.R
- processed outliers dataset in bash (see tutorial), took them over to https://plantgenie.org/Enrichment (no gene ontology observed, but p-fam genes were observed)
  - talks about statistics, description of proteins, q-values, etc.
  

------    
<div id='id-section8'/>   


### Entry 8: 2023-10-04.

- class link: https://pespenilab.github.io/Ecological-Genomics/Fall2023/tutorials/2023-10-04_PopGenomics_Day8.html
- Genotype-Environment Associations (GEA)
- New script titled GEA.R created in scripts folders to output selection outliers
- New script titled ANGSD_GEA

------    
<div id='id-section9'/>   


### Entry 9: 2023-10-09.

-class link: https://pespenilab.github.io/Ecological-Genomics/Fall2023/tutorials/2023-10-09_RNAseq_Day1v2.html
-went over background study and motivation for this project and suggested workflow
Workflow: 
1. Question/design
2. Experimental design
  - extract RNA
  - library prep
3. Sequence
  - Illumina
  - Oxford Nanopore
4. Analysis + visualization
  - fastq: visualize and clean (using program fastp)
  - evaluate de novo assembly (using program trinity)
  - map reads (using program salmon)
  - normalize (using program DESeq2)
  - Identify differentially expressed genes (DEGs) (using program TopGo)
  - Gene ontology (GO) and weighted genen correlation network analysis (using WGCNA program)

- Background study: Copepods, A. hudsonica
  - base of the marine food web
  - one of the most abundant creatures in the world
  - 20 days egg -> adult (quick generation time useful for study)


------    
<div id='id-section10'/>   


### Entry 10: 2023-10-11.

- Background study: continued
  - Copepods: 11 generations, with some missing data due to pandemic
  - Treatments:
    - AA ambient
    - AH acidification
    - HA warming
    - HH acidification and warming
  - Library prep: Illumina paired end reads

-In class coding: class was subset ito generations and questions, I was subsetted into HA F0 (F0 for warming)
1. Logged into ecogen server, found files of interest 
  - data/project_data/RNAseq
2. Made a copy of a script called fastp_ahud.sh
3. Edited script in vim
  - changed MYSAMP to relevant sample
  - the for loop in the file creates new clean files
4. Ran code in bash (fastp_ahud.sh)
  - made new directory called fasp
  - made sure directory is correct when running
  - output .html files
5. transferred .html files to results folder 
  - created new directory within popgen folder on my device: transcriptomics
6. Analyzed fastp .html files


------
<div id='id-section11'/>   


### Entry 11: 2023-10-16.

Class tutorial: https://pespenilab.github.io/Ecological-Genomics/Fall2023/tutorials/2023-10-16_RNAseq_Day3.html

1. Reviewed Illumina data
  - ~20M reads good for eukaryotes
2. Assessed quality of reference transcriptome (looked at N50 values)
3. Use salmon program through trinity to allign and estimate abundance


------
<div id='id-section12'/>   


### Entry 12: 2023-10-18.

Class tutorial: https://pespenilab.github.io/Ecological-Genomics/Fall2023/tutorials/2023-10-18_RNAseq_Day4.html

1. Installed DESeq2
2. Checked mapping results
3. Moced files from slamon to device
4. Created new Rscript: Deseq2.R
  - Saved into "UVM/ecological_genomics_23/transcriptomics/scripts" folder
5. Imported counts table, created dnaseq2 object, PCA to visualize data, compared different generations

------
<div id='id-section13'/>   


### Entry 13: 2023-10-23.

Class tutorial: https://pespenilab.github.io/Ecological-Genomics/Fall2023/tutorials/2023-10-23_RNAseq_Day5.html

- BWA: more freedome for specification than salmon
- Melissa filtered data, which I then moved over using filezilla
- Switched naming schematic: 
  - AM=ambient
  - OA=ocean acidification
  - OW=ocean warming
  - OWA=ocean warming and acidification

1. In ahud_Deseq2_class.R, the following analyses were conducted:
  - multiple PCA to compare clustering in different generations
  - plots to evaluate counts and expression within and across different treatments
  - sideways volcano plots to analyze expression and regulation
  - dendrogram and heatmap to look at gene expression
2. The program euler was used to produce (weighted) venn diagrams
  - includes all up and down regulation
  

------
<div id='id-section14'/>   


### Entry 14: 2023-10-25.

Class tutorial: https://pespenilab.github.io/Ecological-Genomics/Fall2023/tutorials/2023-09-27_PopGenomics_Day6.html

WGCNA: Weighted gene correlation network analysis
-agnostic to metadata
- looks for clusters accross moduoles
- following clustering, we provide the table metadata to so samples and correlations can be loaded for biological traits

1. Load packages and saved file as ahud_WGCNA_class.R
2. Counts matrix loaded
  - filtering was required for the counts table: otherwise it would be too large to process
3. Outlier detection:
  - plotted a tree to detect ouliers in a dendrogram
  - dendrogram visualizes outliers through clustering
  - no outliers were flagged, therfore none were excluded
  - PCA was also used to visualize potential outliers; none detected
4. Normalization occurred using vst() function
5. WGCNA powerthreshold setting using scale free topology model fit and Mean connectivity
  - analysis was chosen to be 'signed,' meaning that it separates between up and down regulation
  - Scale free topology model fit outputs R^2. When chosing a power threshold, it is important to maximize R^2 while minimizing connectivity
6. Blockwise moduoles
  - can set a maximum block size, can reduce blocks
  - minimum block size: 30 genes (default; increase number to reduce modules)
  - need to retain the same random seed for reproducibility
7. Module eigen genes
  - recognizes modules
  - clusters genes into modules
  - can comepare eigengenes within a module
  
------ 
<div id='id-section15'/>   


### Entry 15: 2023-10-30.

Class tutorial:https://pespenilab.github.io/Ecological-Genomics/Fall2023/tutorials/2023-10-30_RNAseq_Day7.html

Once again working in ahud_WGCNA_class.R script

1. Loaded packages and WGCNA  
  - uploaded one from the server to reduce the amount of time spent recreating it
2. Plotted the degree of correlation among 5 traits in a heatmap using Corlevelplot
  - the intensity of the color corresponded to the strength of the correlation
  - asterisks denote significance
3. Next step: looking more at a certain module, in this case, the yellow module
4. Plotted eigengenes accross generations and counts accross generations
  - general correlation of eigengenes vs. counts, which indicates expression corresponds to the counts present
5. Plotted heat map using pheatmap library
  - difficult to see with a black background, change to white


------ 
<div id='id-section16'/>   


### Entry 16: 2023-11-01.

Class tutorial: https://pespenilab.github.io/Ecological-Genomics/Fall2023/tutorials/2023-11-01_RNAseq_Day8.html

Gene ontology overview: 
- genes are nested into processes
- False discovery rate (FDR)
  - given parameters of significance testing, when analyzing large data sets (-omics, etc.), it is important to keep in mind type II error (the rate at which alpha values are accepted regardless of biological significance)

GOmwu
- requires continuous csv and a tab delimited table
- GO database: go.obo, looks at nestledness of data (genes are nestled)
- BP for go enrichment is more relevant than other categories
- Used GOmwu program in R


------    
<div id='id-section17'/>   


### Entry 17: 2023-11-02.

HW#2 Workflow
- created new script titled ahud_WGCNA_hw.R and saved to scripts
- copied code from script titled ahud_WGCNA_class.R
- went through code as is
- commented out portion that loaded in bwa WGCNA from prior class

1. Ran through WGCNA process (lines in #4. Network correlation) with signed network type and softpower of 6 (as demonstrated in the power picking matrix)
2. Output figures, which were saved to my local device 
  - power picking matrix
  - cluster dendrogram
  - heat map
3. Ran through steps 1 and 2 but changed the following parameters
  a. softpower 7, signed (had to modify heatmap parameters to adjust axes)
  b. softpower 8, signed (had to modify heatmap parameters to adjust axes)
  c. softpower 5, unsigned
    -unsigned: power picking matrix indicated softpower of 5
    
    ------    
<div id='id-section18'/>   


### Entry 18: 2023-11-06.

Class link: https://pespenilab.github.io/Ecological-Genomics/Fall2023/tutorials/Csenge_structural_variation.html

- Structural variation: 
  - Different types...some that change the length of genome (imbalanced), some that don't change the number (balanced)
  - Different processes give rise to different types of variation
  - Cause many more mutations/diseases than SNPs
  
- Methods for detecting SVs
  - Array based detection

- Workflow
  - Look for differences
  - Make PCAs
  - Find distances between PCA maps
  - Make "mega PCA"
    -Each dot represents a "window:" group of comared sequence from genomes
  - combine windows to make another PCA to look at structure
  
- Study system
  - 7 populations of purple urchins along the west coast
  - Different genetic diversity, no overall population structure due to gene flow 

- Mapping algorithm
  - Loop through files to map
- Called variants from mapped file
  - 21 scaffolds with information from 114 individual
  - Scaffolds: roughly size of chromosomal groups
  
- Bash workflow
  - In folder /netfiles/ecogen/structural_variation/ there are files for working today
  - I'll be working with chromosome # 7
  - 7. NW_022145602.1
  - copied chromosome to new directory str_data
  - Edited filtering script in VIM, started running filtering in tmux
  -Ran a local PCA in tmux