#!/bin/bash
for i in *.sam
do
samtools view -S -b -h ${i}> ${i/.sam/.aligned.bam}
done
