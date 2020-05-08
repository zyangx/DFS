wkDIR=$1

sample=$2

cat  ${wkDIR}/${sample} | while read line  ### 
do
	sampleID=`echo $line | cut -d ' '  -f 1`
	sampleName=`echo $line | cut -d ' ' -f 2`
	zcat ${wkDIR}/eachsample/${sampleID}.fastq.gz | awk '{if(NR%4 == 1){print ">"  substr($0, 2)}}{if(NR%4 == 2){print}}'  >   ${wkDIR}/fasta/${sampleID}.fa

done


