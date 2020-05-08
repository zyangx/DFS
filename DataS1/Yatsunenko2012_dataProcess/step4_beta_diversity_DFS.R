#### define DFS function #### 
DFS <- function(A, B){
	A.idx <- which( A > 0)
	B.idx <- which( B > 0)
	inter.idx <- intersect(A.idx, B.idx)
	mydist <- -1 / log(1- sqrt(  (2 * length(inter.idx) + 1) / ( length(A.idx) + length(B.idx) )  ) )
	return(mydist)
}

### read in raw data
otu_table.m <- as.matrix(read.csv("otu_table_filter100_rare.txt", header=T, row.names=1, sep="\t", skip=1, check.names=FALSE))

### get distance matrix
DFS.m <- matrix(NA, nrow=ncol(otu_table.m), ncol=ncol(otu_table.m))
rownames(DFS.m) <- colnames(otu_table.m)
colnames(DFS.m) <- colnames(otu_table.m)

for(i in 1:ncol(otu_table.m)){
	for(j in 1:ncol(otu_table.m)){
		a.v <- otu_table.m[,i]
		b.v <- otu_table.m[,j]
		dis <- DFS(a.v, b.v)
		DFS.m[i,j] <- dis
	}
}

write.table(DFS.m, "DFS_otu_table_filter100_rare.txt", sep="\t", quote=F, col.names = NA)



