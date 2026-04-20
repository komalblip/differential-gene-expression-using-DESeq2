# differential-gene-expression-using-DESeq2

# Transcriptomic analysis of Integrated Stress Response in Lung cancer Cells

## Overview
This project performs differential gene expression analysis using RNA-seq data with DESeq2 in R. The RNA-seq data used for this analysis was taken from GEO (Accession:312828). This dataset contains RNA-seq data of tumor cells following siRNA-mediated knockdown of CHCHD10. 
The study is motivated by the role of the mitochondrial integrated stress response (ISR) in cancer evolution and cellular adaptation under stress conditions.
The analysis includes normalization, statistical testing, and visualization of results.

---

## Biological question
Does CHCHD10 knockdown modulate stress-response and lineage plasticity programs in lung cancer cells?

---

## Dataset
- Source: Gene Expression Omnibus
- Study context: Lung cancer cell line perturbation experiment
- Conditions:
- siCTRL (non-targeting control)
- siCHCHD10 (gene knockdown)

---

## Methods
### 1. Data processing
- Raw count matrix obtained from GEO
- Sample metadata curated and matched to expresssion data

### 2. Differential Expression Analysis
- Tool: DESeq2 (R)
- Normalization: median of ratios method
- Statistical testing: Wald test with multiple testing correction
- Significance threshold: adjusted p-value < 0.05

### 3. Exploratory Analysis
- Principal Component Analysis (PCA) to assess sample clustering and variance structure
- Visualization of expression patterns across conditions
  
---

## Tools and libraries
- R
- DESeq2
- ggplot2
- Bioconductor
- RStudio

---

## Workflow

- Data import
- Normalization
- Differential expression analysis using DESeq2
- Statistical filtering of significant genes
- Visualization (PCA plot, volcano plot, heatmap)

---

## Biological Interpretation

Preliminary results suggest that CHCHD10 knockdown induces transcriptional changes consistent with altered mitochondrial function and stress-response activation. These changes may reflect modulation of integrated stress response pathways and potential shifts in cellular state (lineage plasticity) in lung cancer cells

---

## Key concepts

- RNA-seq differential expression
- Integrated stress response (ISR)
- Cancer cell plasticity
- Mitochondrial stress signaling
- Bulk transcriptomics analysis

---

## Future directions

- Pathway enrichment analysis (GO/KEGG)
- Gene set enrichment analysis
- Validation of key stress-response genes
- Integration with survival or clinical datasets

---

## Data source

Gene Expression Omnibus (GEO): publicly available RNA-seq dataset related to lung cancer stress-response biology (Accession: 312828)

---
