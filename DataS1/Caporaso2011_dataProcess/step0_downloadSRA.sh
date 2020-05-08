wkDIR=$1

sample=$2

cat  ${wkDIR}/${sample} | while read line  
do
		sampleID=`echo $line | cut -d ' '  -f 1`
		~/software/sratoolkit.2.9.6-1-centos_linux64/bin/prefetch  ${sampleID}   -O  sra
		~/software/sratoolkit.2.9.6-1-centos_linux64/bin/fastq-dump  ${wkDIR}/sra/${sampleID}.sra   -O  eachSample 
done


