#/bin/bash


set -e
set -u

###### get working directory from $1 ######
wkDIR="~/project/ERP021896"
#wkDIR=$1
###### get directory for fastq files from $2 ######
sampleDIR="fasta"
#sampleDIR=$2

###### get sample description file from $3 ######
sampleDec="SRR_Acc_List.txt"  
#sampleDec=$3

cat  ${wkDIR}/${sampleDec} | while read line   
do
	sampleID=`echo $line |cut  -f 1 `
	R1ID=$sampleID".fasta"
	#echo ${wkDIR}/fasta/${R1ID}
	pick_closed_reference_otus.py   -i  ${wkDIR}/fasta/${R1ID}   -o ${wkDIR}/eachSampleOTU/${sampleID}  -f 

done



