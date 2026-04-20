# 1. Installing packages
install.packages("BiocManager")
BiocManager::install("DESeq2")
# 2. Loading the data
counts <- read.csv("GSE312828_Counts_siCTL_sic10.csv", row.names = 1)
# 3. Creating metadata
samples <- colnames(counts)

coldata <- data.frame(
  row.names = samples,
  condition = ifelse(grepl("siCtrl", samples), "control", "treatment")
)
# 4. Loading the table
table(coldata$condition)
# 5. Loading DESeq2
library(DESeq2)
# 6. Load the dataset
dds <- DESeqDataSetFromMatrix(
  countData = counts,
  colData = coldata,
  design = ~condition
)

# 7. EstimateSizeFactors (to compare the variability of counts)
dds <- estimateSizeFactors(dds)
# 8. Estimating dispersions
dds <- estimateDispersions(dds)
# 9. Visualizing the effect of shrinkage
plotDispEsts(dds)
# 10. Running analysis
dds <- DESeq(dds)
res <- results(dds)
# 11. Getting results table
res <- res[order(res$pvalue),]
head(res)
# 12. Filter significant genes
sig <- res[which(res$padj < 0.05),]
# 13. Save output
write.csv(as.data.frame(res), "DE_results_all.csv")
write.csv(as.data.frame(sig), "DE_results_significant.csv")
# 14. Adding PCA plots
vsd <- vst(dds)
plotPCA(vsd, intgroup = "condition")
# 15. Adding volcano plot
plot(res$log2FoldChange, -log10(res$padj))
# 16. Validating results
res <- results(dds)
res <- res[order(res$padj),]
resultsNames(dds)
sizeFactors(dds)
summary(res)
# 17. Generating a heat map
vsd <-vst(dds)
mat <- assay(vsd)

top <- order(apply(mat, 1, var), decreasing = TRUE)[1:50]

library(pheatmap)
pheatmap(mat[top,], scale = "row", show_rownames = FALSE)
