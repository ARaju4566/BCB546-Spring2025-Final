# Load libraries

library(EnhancedVolcano)



# Load your DE results (full version recommended)

res <- read.csv("ZDF_vs_WT_DE_results_full.csv", row.names = 1)



# Quick check

head(res)


# Volcano plot

EnhancedVolcano(res,
                lab = rownames(res),
                x = 'log2FoldChange',
                y = 'padj',
                pCutoff = 0.2,
                FCcutoff = 0,  # Show everything, no fold change cutoff
                title = "ZDF vs WT Serum miRNA",
                subtitle = NULL,
                caption = NULL,
                ylab = expression(-log[10](padj)),
                legendLabels = c("NS", "NS", "NS", "FDR < 0.2"),
                legendPosition = "top",
                col = c("grey30", "grey30", "grey30", "red2"),
                colAlpha = 0.9,
                pointSize = 2,
                labSize = 4,
                drawConnectors = TRUE,
                maxoverlaps = 10,
                ylim = c(0, 3))
