library("FactoMineR")
library("factoextra") 
library(RColorBrewer)
library(ggpubr)

meta_data.df <- read.csv("meta_data.txt", header=T, sep="\t")
country.v <- as.vector(meta_data.df$Country)


########
DFS.m <- as.matrix(read.csv("DFS_otu_table_filter10000_rare.txt", header=T, row.names=1, sep="\t"))
tdata.m <- t(DFS.m)
pca <- prcomp(tdata.m,scal=F)
pc12 <- pca$x[,c(1,2)]
pc <-summary(pca)$importance[2,]*100
data.df <- as.data.frame(pc12)
data.df$Sample <- country.v

p1 <- ggscatter(data.df,  x = "PC1", y = "PC2", color = "Sample", shape = "Sample",
          palette =   c("#00AFBB", "#E7B800", "#FC4E07"), size = 1.2, 
          ellipse = TRUE, ellipse.level = 0.99, ellipse.type = "norm", main="DFS", xlab=paste0("PC-1"," (  ",round(pc[1],2),"%"," ) "),ylab=paste0("PC-2"," ( ",round(pc[2],2),"%"," ) "))  + theme_light() + theme(plot.title = element_text(hjust = 0.5))
p1 <- p1 + theme(axis.title.x=element_text(size=rel(0.75)), axis.title.y=element_text(size=rel(0.75)), axis.text.x=element_text(size=rel(0.75)), axis.text.y=element_text(size=rel(0.75)), plot.title = element_text(size=rel(0.85), hjust = 0.5), legend.title=element_text(size=rel(0.8)), legend.text=element_text(size=rel(0.75)))
p1 <- p1 + geom_vline(xintercept = 0, linetype="dashed") + geom_hline(yintercept = 0, linetype="dashed")
p1

####
weighted_unifrac.m <- as.matrix(read.csv("weighted_unifrac_otu_table_filter10000_rare.txt", header=T, row.names=1, sep="\t"))
tdata.m <- t(weighted_unifrac.m)
pca <- prcomp(tdata.m,scal=F)
pc12 <- pca$x[,c(1,2)]
pc <-summary(pca)$importance[2,]*100
data.df <- as.data.frame(pc12)
data.df$Sample <- country.v

p2 <- ggscatter(data.df,  x = "PC1", y = "PC2", color = "Sample", shape = "Sample",
          palette =   c("#00AFBB", "#E7B800", "#FC4E07"), size = 1.2, 
          ellipse = TRUE, ellipse.level = 0.99, ellipse.type = "norm", main="Weighted Unifrac", xlab=paste0("PC-1"," (  ",round(pc[1],2),"%"," ) "),ylab=paste0("PC-2"," ( ",round(pc[2],2),"%"," ) "))  + theme_light()
p2 <- p2 + theme(axis.title.x=element_text(size=rel(0.75)), axis.title.y=element_text(size=rel(0.75)), axis.text.x=element_text(size=rel(0.75)), axis.text.y=element_text(size=rel(0.75)), plot.title = element_text(size=rel(0.85), hjust = 0.5))
p2 <- p2 + geom_vline(xintercept = 0, linetype="dashed") + geom_hline(yintercept = 0,linetype="dashed")
p2

####
unweighted_unifrac.m <- as.matrix(read.csv("unweighted_unifrac_otu_table_filter10000_rare.txt", header=T, row.names=1, sep="\t"))
tdata.m <- t(unweighted_unifrac.m)
pca <- prcomp(tdata.m,scal=F)
pc12 <- pca$x[,c(1,2)]
pc <-summary(pca)$importance[2,]*100
data.df <- as.data.frame(pc12)
data.df$Sample <- country.v

p3 <- ggscatter(data.df,  x = "PC1", y = "PC2", color = "Sample", shape = "Sample",
          palette =   c("#00AFBB", "#E7B800", "#FC4E07"), size = 1.2, 
          ellipse = TRUE, ellipse.level = 0.75, ellipse.type = "norm", main="Unweighted Unifrac", xlab=paste0("PC-1"," (  ",round(pc[1],2),"%"," ) "),ylab=paste0("PC-2"," ( ",round(pc[2],2),"%"," ) "))  + theme_light() 
p3 <- p3 + theme(axis.title.x=element_text(size=rel(0.75)), axis.title.y=element_text(size=rel(0.75)), axis.text.x=element_text(size=rel(0.75)), axis.text.y=element_text(size=rel(0.75)), plot.title = element_text(size=rel(0.85), hjust = 0.5))
p3 <- p3 + geom_vline(xintercept = 0, linetype="dashed") + geom_hline(yintercept = 0,linetype="dashed")
p3

####
euclidean.m <- as.matrix(read.csv("euclidean_otu_table_filter10000_rare.txt", header=T, row.names=1, sep="\t"))
tdata.m <- t(euclidean.m)
pca <- prcomp(tdata.m,scal=F)
pc12 <- pca$x[,c(1,2)]
pc <-summary(pca)$importance[2,]*100
data.df <- as.data.frame(pc12)
data.df$Sample <- country.v

p4 <- ggscatter(data.df,  x = "PC1", y = "PC2", color = "Sample", shape = "Sample",
          palette =   c("#00AFBB", "#E7B800", "#FC4E07"), size = 1.2, 
          ellipse = TRUE, ellipse.level = 0.99, ellipse.type = "norm", main="Euclidean", xlab=paste0("PC-1"," (  ",round(pc[1],2),"%"," ) "),ylab=paste0("PC-2"," ( ",round(pc[2],2),"%"," ) "))  + theme_light() 
p4 <- p4 + theme(axis.title.x=element_text(size=rel(0.75)), axis.title.y=element_text(size=rel(0.75)), axis.text.x=element_text(size=rel(0.6)), axis.text.y=element_text(size=rel(0.6)), plot.title = element_text(size=rel(0.85), hjust = 0.5))
p4 <- p4 + geom_vline(xintercept = 0, linetype="dashed") + geom_hline(yintercept = 0,linetype="dashed")
p4

####
bray_curtis.m <- as.matrix(read.csv("bray_curtis_otu_table_filter10000_rare.txt", header=T, row.names=1, sep="\t"))
tdata.m <- t(bray_curtis.m)
pca <- prcomp(tdata.m,scal=F)
pc12 <- pca$x[,c(1,2)]
pc <-summary(pca)$importance[2,]*100
data.df <- as.data.frame(pc12)
data.df$Sample <- country.v

p5 <- ggscatter(data.df,  x = "PC1", y = "PC2", color = "Sample", shape = "Sample",
          palette =   c("#00AFBB", "#E7B800", "#FC4E07"), size = 1.2, 
          ellipse = TRUE, ellipse.level = 0.99, ellipse.type = "norm", main="Bray_Curtis", xlab=paste0("PC-1"," (  ",round(pc[1],2),"%"," ) "),ylab=paste0("PC-2"," ( ",round(pc[2],2),"%"," ) "))  + theme_light() 
p5 <- p5 + theme(axis.title.x=element_text(size=rel(0.75)), axis.title.y=element_text(size=rel(0.75)), axis.text.x=element_text(size=rel(0.75)), axis.text.y=element_text(size=rel(0.75)), plot.title = element_text(size=rel(0.85), hjust = 0.5))
p5 <- p5 + geom_vline(xintercept = 0, linetype="dashed") + geom_hline(yintercept = 0,linetype="dashed")
p5

####
binary_jaccard.m <- as.matrix(read.csv("binary_jaccard_otu_table_filter10000_rare.txt", header=T, row.names=1, sep="\t"))
tdata.m <- t(binary_jaccard.m)
pca <- prcomp(tdata.m,scal=F)
pc12 <- pca$x[,c(1,2)]
pc <-summary(pca)$importance[2,]*100
data.df <- as.data.frame(pc12)
data.df$Sample <- country.v

p6 <- ggscatter(data.df,  x = "PC1", y = "PC2", color = "Sample", shape = "Sample",
          palette =   c("#00AFBB", "#E7B800", "#FC4E07"), size = 1.2, 
          ellipse = TRUE, ellipse.level = 0.99, ellipse.type = "norm", main="Jaccard", xlab=paste0("PC-1"," (  ",round(pc[1],2),"%"," ) "),ylab=paste0("PC-2"," ( ",round(pc[2],2),"%"," ) "))  + theme_light() 
p6 <- p6 + theme(axis.title.x=element_text(size=rel(0.75)), axis.title.y=element_text(size=rel(0.75)), axis.text.x=element_text(size=rel(0.75)), axis.text.y=element_text(size=rel(0.75)), plot.title = element_text(size=rel(0.85), hjust = 0.5))
p6 <- p6 + geom_vline(xintercept = 0, linetype="dashed") + geom_hline(yintercept = 0,linetype="dashed")
p6


p <- ggpubr::ggarrange(p1, p2, p3, p4, p5, p6, nrow=2, ncol=3, labels=c('A', 'B', 'C', 'D', 'E', 'F'),font.label = list(size = 12), legend="bottom",common.legend = TRUE)
p
