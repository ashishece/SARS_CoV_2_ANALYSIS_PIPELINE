#!/bin/bash
for i in *.aligned.sorted.bam
do
fgbio TrimPrimers  -i ${i} -o ${i/.aligned.sorted.bam/.trimprimed.bam} -p SARS-COV-2.FLEX_With_Addonv2Feb2022_primer_info.tab -H true
samtools index ${i/.aligned.sorted.bam/.trimprimed.bam}
done
