### beta diversity ###
### calculate beta_diversity: binary_jaccard,bray_curtis,euclidean
beta_diversity.py  -i otu_table_filter10000_rare.biom    -o ./beta_diversity    -m binary_jaccard,bray_curtis,euclidean

### calculate beta_diversity: unweighted_unifrac,weighted_unifrac
align_seqs.py        -i otu_table_filter10000_rare_repSeq.fasta  -m pynast   -o ./rep_seq/alignment/
#make_phylogeny.py   -i ./rep_seq/otu_table_filter10000_rare_repSeq_aligned.fasta  -o ./rep_seq/otu_table_filter10000_rare_repSeq_aligned.tre
#beta_diversity.py   -i otu_table_filter10000_rare.biom   -o ./beta_diversity   -t ./rep_seq/otu_table_filter10000_rare_repSeq_aligned.tre   -m  unweighted_unifrac,weighted_unifrac

### get seqquence of V4 region by using the primer of 515F 806R
mothur > align.seqs(fasta=./rep_seq/Ecoli_16sV4_F515R806.fa, reference=./rep_seq/otu_table_filter10000_rare_repSeq_aligned.fasta)
mothur > summary.seqs(fasta=/home/wkdir/picked_otus_all525/rep_seq/Ecoli_16sV4_F515R806.align)
mothur > pcr.seqs(fasta=/home/wkdir/picked_otus_all525/rep_seq/otu_table_filter10000_rare_repSeq_aligned.fasta, start=2264, end=4091, keepdots=F, processors=8)
mothur > pcr.seqs(fasta=otu_table_filter10000_rare_repSeq_aligned.fasta, start=2264, end=4091, keepdots=F)

####### remove "." before 
make_phylogeny.py   -i ./rep_seq/otu_table_filter10000_rare_repSeq_aligned.V4pcr.fasta  -o ./rep_seq/otu_table_filter10000_rare_repSeqV4pcr_aligned.tre
beta_diversity.py   -i otu_table_filter10000_rare.biom    -o ./beta_diversity   -t ./rep_seq/otu_table_filter10000_rare_repSeqV4pcr_aligned.tre  -m  unweighted_unifrac,weighted_unifrac

