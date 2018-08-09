#!/bin/bash

# For each sample fastq, take the sam file and result in a list of gi and reference numbers

samples='36 37 38 44 45 46'

for sample in $samples
do
	indir=~/16s_rrna_amplicons_project	

	# Turning sam file into bam file
	samtools view -S -b ${indir}/bwamem_sample.${sample}.202.sam > ${indir}/bwamem_sample.${sample}.202.bam

	# Removing supplementary and secondary alignments so each read only aligns to one place
	samtools view -h ${indir}/bwamem_sample.${sample}.202.bam | grep -v -e 'XA:Z:' -e 'SA:Z:' | samtools view -b > ${indir}/bwamem_sample.${sample}.202.unique.bam

	# Pulling the gi and ref numbers from the alignment and moves them to their own file
	samtools view ${indir}/bwamem_sample.${sample}.202.unique.bam | awk '{print $3}' | grep "gi|.*|ref|.*|" -o > bwamem_sample.${sample}.202.unique.giandrefnumbers.txt

done
