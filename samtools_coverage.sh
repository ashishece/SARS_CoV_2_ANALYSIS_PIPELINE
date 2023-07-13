#!/bash/bin
for i in *.trimprimed.filtered.bam
do
samtools coverage ${i} > ${i/.trimprimed.filtered.bam/}.tsv

done
