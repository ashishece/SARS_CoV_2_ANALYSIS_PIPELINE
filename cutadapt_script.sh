#!/bin/bash
for i in *_R1_001.fastq.gz
do
j=${i/_R1_001.fastq.gz/_R2_001.fastq.gz}
cutadapt -g CCTACACGACGCTCTTCCGATCT \
  -a AGATCGGAAGAGCACACGTCTGAA \
  -A AGATCGGAAGAGCGTCGTGTAGG \
  -G TTCAGACGTGTGCTCTTCCGATCT \
  -e 0.1 -O 9 -m 20 -n 2 \
  -o ${i/_R1_001.fastq.gz/_R1_trim.fastq.gz} -p  ${j/_R2_001.fastq.gz/_R2_trim.fastq.gz} \
     ${i} ${j}

done

