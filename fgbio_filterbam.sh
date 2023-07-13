#!/bin/bash
for i in *.trimprimed.bam
do

fgbio FilterBam -i ${i} -o ${i/.trimprimed.bam/.trimprimed.filtered.bam} -m 40
samtools index ${i/.trimprimed.bam/.trimprimed.filtered.bam} 

done
