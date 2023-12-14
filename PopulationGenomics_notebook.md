# Ecological Genomics Lab Notebook

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
* [Entry 16: 2023-11-01](#id-section16)
* [Entry 17: 2023-11-02](#id-section17)
* [Entry 18: 2023-11-06](#id-section18)
* [Entry 19: 2023-11-07](#id-section19)
* [Entry 20: 2023-11-08](#id-section20)
* [Entry 21: 2023-11-10](#id-section21)
* [Entry 22: 2023-11-27](#id-section22)


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
  
------    
<div id='id-section19'/>   


### Entry 19: 2023-11-07.

HW#2 workflow

- Evaluate number of clusters from WGCNA and number of genes assinged
- Make into data frame (wgcna_md.csv in transcriptomics>results folder)
- Make new script titled ahud_hw_barplot.R
- Use ggplot to make grouped and stacked bar plots to visualize data

------    
<div id='id-section20'/>   


### Entry 20: 2023-11-08.

SV day 2: https://pespenilab.github.io/Ecological-Genomics/Fall2023/tutorials/Csenge_structural_variation.html

- followed class tutorial lead by Csenge 
- Workflow: 
  1. chopping up genome
  2. computing PCA
  3. making a matrix to compare winsows
  4. combine windows
  5. pull out pca

Class: 
  1. Log onto server
  2. Look at data in lostruct_results, file titles type_snp_size_1000_weights_none_jobid_526809
  3. Vim run_lostruct.R -> script from developer
    - vcf_windower: uses information to generate pc distance
    - saves it as variables written into .csv
  4. generates MDS and PCA


------    
<div id='id-section21'/>   


### Entry 21: 2023-11-10.

Homework #3 workflow 
Class link: https://pespenilab.github.io/Ecological-Genomics/Fall2023/assignments/Homework3.html
Assignment: analyze chromosome 7 for differences with significance threshold size

1. Open terminal, enter server
2. CD into myscripts...open summarize_run.Rmd
3. tmux, cd mydata/str_data/lostruct_results/type_SNP_size_1000_weights_none_jobid_526809
4. output new .csv called first_corner.csv
5. Generate unique gene IDs in bash
  Rscript -e 'templater::render_template("~/myscripts/summarize_run.Rmd",output="~/mydata/str_data/lostruct_results/type_snp_size_1000_weights_none_jobid_526809/run_summary_01.html",change.rootdir=TRUE)'

  cut -d, -f1-3 first_corner_01.csv > first_corner_01_formatted.csv

  sed -i 's/"//g' first_corner_01_formatted.csv

  sed -i 's/,/\t/g' first_corner_01_formatted.csv

  /netfiles/ecogen/structural_variation/bedtools2/bin/intersectBed -a first_corner_01_formatted.csv -b genome_annotation.gff -wa -wb > genes_first_corner_01.bed

  sed -n "s/^.*gene=\(LOC[0-9]\+\).*$/\1/p" genes_first_corner_01.bed > gene_names_first_corner_01.txt

  sort gene_names_first_corner_01.txt | uniq > uni_gene_names_first_corner_01.txt
- repeat for all three corners at significance value=0.05 and 0.01


------    
<div id='id-section22'/>   


### Entry 22: 2023-11-27.

Red spruce black spruce final project. Collaborators: Gwen Ellis, Nora Heaphy

Objectives: 
  - evaluate introgression in red spruce (RS) and black spruce (BS) populations
  - identify parts of the genome where introgression are present
  - evaluate whether or not introgression in these populations is adaptive
  
Workflow: 
* All files are saved in ecological_genomics_23 > spruce_final_proj
1. S. Keller reduced the new BS genome with probes for mapping.
    - Located on ecogen server: /netfiles/ecogen/PopulationGenomics/
    - Ref genome is in ref_genome folder
    - fastq files are in /netfiles/ecogen/PopulationGenomics/fastq/black_spruce
2. Genotype liklihood files placed into a beagle file titled RSBS_poly.beagle.gz
3. New vim script titled pcANGSD_RSBS_poly.sh
    - Modified from pcANGSD_allRS_poly.sh to prep files for admixture analysis
4. Input files from pcANGSD into R to generate admixture and PCA plots in R scripts
    - File titled RSBS_pcANGSD.R in scripts folder
    - PCA and admixture plots were evaluated at e=2 and 3, or k=2 and 4
5. PCA comparing RS and BS populations and bioclim variables evaluated
    - File titled RSBS_bioclim.R in scripts folder
    - Combined RS and BS metadata required: found in a file titled RSBScombinedMetaData.csv in data folder
    - Issues loading world clim data, similar to HW1. Alternate files uploaded. 
    - Needed to adjust habillage in Factorextra plot to allow evaluation of populations vs. bioclim variables
    

------    
<div id='id-section23'/>   


### Entry 23: 2023-12-06.

Red spruce black spruce final project. Collaborators: Gwen Ellis, Nora Heaphy

1. Manipulated scripts to analyze PC loadings accross genome
  - found in script titled outlier_pca.R
  - abrupt gap in genome where figures don't allign with ecpectations
  - trouble shooting including indexing the graph to see where problem is occurring
2. Talked to Steve about adjustments, etc. 


------    
<div id='id-section24'/>   


### Entry 24: 2023-12-08.

1. Re-ran NS and BS beagle files (tutorial 6)
  - adjusted mapping scripts to reproduce genotype liklihood beagle (.gz) files, titled mapping_RS.sh and mapping_BS.sh in ~/myscripts
  - new beagle files created. Adjusted pcANGSD scripts and re ran them. New scripts titled pcANGSD_BS_mapped.sh. 
  - Re-ran selection scans to produce outlier loci. (Tutorial 7) New scripts titled pcANGSD_selection_BS.sh and pcANGSD_selection_NS.sh.
2. New bam lists, .cov, .npy, etc. files transferred to local machine using filezilla
2. Re-ran relevant analyses in R, evaluated admixture and PCA plots using BS reference to compare to NS reference files. 
  - Overwhelmingly similar NS/BS plots
  - even with newly produced files, ran into issues with "manhattan plot" across the genome...talked further to Steve, who hypothesizes "the switch-over between the 2 different distributions of loadings occurs at approx the halfway point. In other words, it looks like there are the same numbers of loci in each distribution, which is not at all what you would expect unless perhaps it reflects each locus getting 2 values -- one from each distirbution."
  - I abandoned the PC loadings accross the genome plot!! Too much hassle
  

------    
<div id='id-section25'/>   


### Entry 24: 2023-12-10.

Last coding session for Spruced up: Identifying potentially adaptive black spruce introgression in red spruce populations presentaton and project.

Collaborators: G. Ellis, N. Heaphy
Final presentation 12/11/23, available via google slides
Final paper 12/14/23, available via google docs

1. Plot PC loadings vs. allele frequency in outlier_pca.R
2. Filter so that BS samples are colored black and RS samples are colored red
3. Output relevant outlier contigs
4. use following commands in bash to get outlier genes: 
 - ANNOT="/netfiles/ecogen/PopulationGenomics/ref_genome/annotation/Pabies1.0-all-cds.gff3.gz"
 - OUTLIERS=/netfiles/ecogen/groupProjects/sprucedUp/RS_results/RS_PC1_outlier_contigs.txt
 - zcat ${ANNOT} | grep -f ${OUTLIERS} | grep "gene" | uniq | cut -f9 | sed "s/ID=//g"
5. Put lists of significant genes into plantgenie.org to obtain enrichment, GO, and protein family identification

Last coding bit for this class! Very happy with the outputs and growth :)
