#!/bin/bash
for i in *.trimprimed.filtered.bam
do

samtools mpileup -aa -A -d 0 -B -Q 0 -f NC_045512.2.fasta ${i} | ivar variants -p ${i/.trimprimed.filtered.bam}

done
