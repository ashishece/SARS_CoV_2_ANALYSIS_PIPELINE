#!/bin/bash
for i in *.aligned.bam
do
samtools sort ${i} > ${i/.aligned.bam/.aligned.sorted}.bam
done
