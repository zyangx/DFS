### permanova  adonis ###

compare_categories.py --method permanova  -i binary_jaccard_otu_table_filter10000_rare.txt    -m  meta_data.txt   -c Country  -o  permanova_out/binary_jaccard_country  -n 10000
compare_categories.py --method permanova  -i bray_curtis_otu_table_filter10000_rare.txt      -m  meta_data.txt   -c Country  -o  permanova_out/bray_curtis_country -n  10000
compare_categories.py --method permanova  -i euclidean_otu_table_filter10000_rare.txt        -m  meta_data.txt   -c Country  -o  permanova_out/euclidean_country -n  10000
compare_categories.py --method permanova  -i DFS_otu_table_filter10000_rare.txt         -m  meta_data.txt   -c Country  -o  permanova_out/DFS_country  -n 10000
compare_categories.py --method permanova  -i unweighted_unifrac_otu_table_filter10000_rare.txt      -m  meta_data.txt   -c Country  -o  permanova_out/unweighted_unifrac_country -n  10000
compare_categories.py --method permanova  -i weighted_unifrac_otu_table_filter10000_rare.txt        -m  meta_data.txt   -c Country  -o  permanova_out/weighted_unifrac_country -n  10000

