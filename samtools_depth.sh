#!/bin/bash
for i in *.trimprimed.filtered.bam
do
samtools depth ${i} > ${i/.trimprimed.filtered.bam}.tsv

done

