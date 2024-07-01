#Import library
suppressPackageStartupMessages(library(DESeq2))

# Reading the dataset
data <- read.table("low_normal.cntTable",header=T,row.names=1)

#Creating groups
groups <- factor(c(rep("TGroup",9),rep("CGroup",7)))

#Setting paramters
min_read <- 1

#Applying filters
data <- data[apply(data,1,function(x){max(x)}) > min_read,]

#Generating sampleinfo
sampleInfo <- data.frame(groups,row.names=colnames(data))

#Applying DESeq2
dds <- DESeqDataSetFromMatrix(countData = data, colData = sampleInfo, design = ~ groups)
dds$groups = relevel(dds$groups,ref="CGroup")
dds <- DESeq(dds)
res <- results(dds,independentFiltering=F)
resSig <- res[!is.na(res$padj) & res$padj < 0.05, ]

write.csv(resSig, file = "DEG_low_normal.csv", row.names = TRUE)
