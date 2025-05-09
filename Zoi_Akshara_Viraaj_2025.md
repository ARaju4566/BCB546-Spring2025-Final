
"An author(s)-YEAR.md file that introduces the original paper, explains the technical details of your replication of analyses and summarizes your replication of the original results."

# Original Paper Introduction

## Effect of Anti-Osteoporotic Treatments on Circulating and Bone Micro RNA Patterns in Osteopenic ZDF RATS
### By Vazquez et al.
#### Link: https://www.mdpi.com/1422-0067/23/12/6534

Type 2 Diabetes is diagnosed when a person’s body begins to not respond to insulin or when the pancreas cannot make enough insulin to keep blood sugar levels within a healthy range, 
and then as a result glucose builds up in the bloodstream instead of being absorbed by a person's cells.


T2DM accounts for 90% of all diabetes cases in adults and due to the obesity epidemic it has become increasingly prevalent.
Not only does it affect how the body absorbs glucose but it also affects bone health by lowering bone material density in the later stages of the disease, which increases mortality and healthcare costs.
Studies have also suggested that type 1 and type 2 diabetes have different mechanisms that lead to bone fragility that haven’t been researched yet, and they have also shown that miRNAs play a crucial role in both diabetes and bone development.

The paper examines the affects that miRNA has on bone development and it's role in T2DM through collecting and analyzing serum and bone tissue samples from a rat model of T2DM, the Zucker Diabetic Fatty Model (ZDF) for short who received four different treatment options such as anti-sclerostin, parathyroid hormone or PTH, insulin, or a placebo.

These samples were then run through an untargeted microRNA NGS discovery assay, miND, to quantify miRNA levels in both serum and bone tissue samples, also known as ulna samples.
Using their sequencing data, they performed a hierarchical clustering analysis, as well as univariate and multivariate statistical analysis, gene target network analysis and cell-type enrichment analysis to select for significant miRNA biomarkers of diabetic bone disease.

To examine which miRNAs were dysregulated, the authors created volcano graphs that compared ZDF placebo vs WT-placebo. They also created two other volcano graphs to view which miRNAs were regulated through treatment with either insulin or anti-scl by comparing ZDF-placebo vs ZDF-insulin, and ZDF-placebo vs ZDF-anti-scl.


We decided to replicate the volcano graphs because they depict the main findings of the paper and are easy to understand.


# Technical Details
The study aimes to analyse the differential expression levels of miRNA extracted from Zucker Diabetic Fatty model (ZDF) and wild type rats.
RNA sequencing was performed for serum or ulna bone samples after these rats were treated with anti-sclerotsin, parathyroid hormone, insulin and placebo as control. 
RNA sequencing helps to analyse which of the miRNAs are upregulated, downregulated so that these results can be associated to the physiological and biochemcial symtomps seen with T2DM.

RNA analysis pipeline 
The SRA sequences were extracted from GEO accession server as directed by the authors in the paper. The quality of the NGC data was then analyzed with FASTQC and MULTIQC. Since sequences have adapters at the ends they were trimmed and was performed used the software Cutadapt. We obtained cleaned .fastq files which were converted to fasta files and sequences which were less than 17bp were filtered out before the next step.

We then used miRDeep2 which is a software used for identification of novel and known miRNAs in deep sequencing data as well as for miRNA expression profiling across samples
We used 2 of the components in this software namely the mapper.pl and quantifier.pl

1. mapper.pl : this processes reads and/or maps them to the reference genome.
   Input files: Default input is a file in fasta, seq.txt or qseq.txt format. More input can be given depending on the
   options used.
   Output files: A fasta file with precursor sequences, a fasta file with mature miRNA sequences, a fasta file with deep 
   sequencing reads and optionally a fasta file with star sequences and the 3 letter code of the species of interest
2. quantifier.pl: The module maps the deep sequencing reads to predefined miRNA precursors and determines by that the 
   expression of the corresponding miRNAs. First, the predefined mature miRNA sequences are mapped to the predefined 
   precursors.
   Input files: Files genrated form mapper.pl are input into the quantifier part.
   output files: A tab separated file called miRNAs_expressed_all_samples.csv with miRNA identifiers and its read count, a 
   signature file called miRBase.mrd, a file called expression.html that gives an overview of all miRNAs.

Visualisation
Differential expression analysis was performed using edgeR using the quasi-likelihood negative binomial generalized log-linear model functions provided by the package. The independent filtering method of DESeq2 was adapted for use with edgeR to remove low-abundance miRNAs and thus optimize the false discovery rate (FDR) correction.
Volcano plots were generated for the placebo samples and later for the treated samples using EnhancedVolcano in R program. 
