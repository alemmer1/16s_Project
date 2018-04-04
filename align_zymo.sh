#!/bin/bash

if [ "$1" == "align" ];
then

	dir=./
	fq=170718_16s_zymoStandards_2000reads
	ref=./16SMicrobial.fasta

	./minimap2/minimap2 --secondary=no -a -x map-ont -t 5 ${ref} ${dir}/${fq}.fq | samtools view -b - | samtools sort -o ${fq}.minimap2.bam

	samtools index ${fq}.minimap2.bam

fi
