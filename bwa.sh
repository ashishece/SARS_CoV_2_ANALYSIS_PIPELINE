#!/bin/bash
for i in *_R1_trim.fastq.gz
do
j=${i/_R1_trim.fastq.gz/_R2_trim.fastq.gz}
bwa mem  -t 8 NC_045512.2.fasta ${i} ${j} -o ${i/_R1_trim.fastq.gz}.sam 

done
