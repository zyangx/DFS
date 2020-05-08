
### M3 stool ###
metadata.df <- read.csv("meta_data_M3_stool_stool.txt", header=T, row.names=1, sep="\t", check.names=F )

binary_jaccard.m <-  as.matrix(read.csv("./beta_diversity/binary_jaccard_otu_table_filter100_rare_filter.txt", header=T, row.names=1, sep="\t", check.names=F ))
bray_curtis.m <-  as.matrix(read.csv("./beta_diversity/bray_curtis_otu_table_filter100_rare_filter.txt", header=T, row.names=1, sep="\t", check.names=F ))
euclidean.m <-  as.matrix(read.csv("./beta_diversity/euclidean_otu_table_filter100_rare_filter.txt", header=T, row.names=1, sep="\t", check.names=F ))
DFS.m <-  as.matrix(read.csv("./beta_diversity/EvoDist3_otu_table_filter100_rare_filter.txt", header=T, row.names=1, sep="\t", check.names=F ))
unweighted_unifrac.m <-  as.matrix(read.csv("./beta_diversity/unweighted_unifrac_otu_table_filter100_rare_filter.txt", header=T, row.names=1, sep="\t", check.names=F ))
weighted_unifrac.m <-  as.matrix(read.csv("./beta_diversity/weighted_unifrac_otu_table_filter100_rare_filter.txt", header=T, row.names=1, sep="\t", check.names=F ))

timeseries.m <- matrix(NA, nrow=nrow(DFS.m), ncol=nrow(DFS.m)) 
rownames(timeseries.m) <- rownames(DFS.m)
colnames(timeseries.m) <- rownames(DFS.m)
for(i in 1:nrow(timeseries.m)){
	for(j in 1:ncol(timeseries.m)){
		timeseries.m[i,j] <- abs(metadata.df[rownames(timeseries.m)[i], 8] - metadata.df[rownames(timeseries.m)[j], 8])
	}
}
write.table(timeseries.m , file="./beta_diversity/M3_stool_time_interval.txt", sep="\t", quote=F, col.names = NA)

#####
DistCoor.m <- matrix(NA, nrow=nrow(timeseries.m)*6, ncol=2) 
colnames(DistCoor.m) <- c("cor", "type")
DistCoor.df <- as.data.frame(DistCoor.m)
for(i in 1:nrow(timeseries.m)){
	DistCoor.df[i, 1] <- cor(binary_jaccard.m[, i] ,  timeseries.m[ ,i])
	DistCoor.df[i+nrow(timeseries.m), 1] <- cor(bray_curtis.m[, i] ,  timeseries.m[ ,i])
	DistCoor.df[i+nrow(timeseries.m)*2, 1] <- cor(euclidean.m[, i] ,  timeseries.m[ ,i])
	DistCoor.df[i+nrow(timeseries.m)*3, 1] <- cor(DFS.m[, i] ,  timeseries.m[ ,i])
	DistCoor.df[i+nrow(timeseries.m)*4, 1] <- cor(unweighted_unifrac.m[, i] ,  timeseries.m[ ,i])
	DistCoor.df[i+nrow(timeseries.m)*5, 1] <- cor(weighted_unifrac.m[, i] ,  timeseries.m[ ,i])

	DistCoor.df[i, 2] <- "binary_jaccard"
	DistCoor.df[i+nrow(timeseries.m), 2] <- "bray_curtis"
	DistCoor.df[i+nrow(timeseries.m)*2, 2] <- "euclidean"
	DistCoor.df[i+nrow(timeseries.m)*3, 2] <- "DFS"
	DistCoor.df[i+nrow(timeseries.m)*4, 2] <- "unweighted_unifrac"
	DistCoor.df[i+nrow(timeseries.m)*5, 2] <- "weighted_unifrac"
}

DistCoor.df$sample <- rep(rownames(timeseries.m), 6)

ggplot(DistCoor.df, aes(x = cor)) + geom_histogram(stat = "bin", bins = 30, fill = "lightblue", colour = "black") + facet_wrap(type ~ . ) + theme_bw()
