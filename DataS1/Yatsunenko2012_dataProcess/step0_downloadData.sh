wkDIR=$1

sample=$2

cat  ${wkDIR}/${sample} | while read line  ### 
do
	samplefile=`echo $line`
	wget $samplefile

done


