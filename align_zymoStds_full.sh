#!/bin/bash

if [ "$1" == "index" ];
then
	ref=./16SMicrobial.mmi

	./minimap2/minimap2 -x map-ont -d ${ref} ./16SMicrobial.fasta

fi


if [ "$1" == "align" ];
then

	dir=./
	fq=170718_16s_zymoStandards
	ref=./16SMicrobial.mmi

	./minimap2/minimap2 --secondary=no -a -x map-ont -t 5 ${ref} ${dir}/${fq}.fq | samtools view -b - | samtools sort -o ${fq}.minimap2.bam

	samtools index ${fq}.minimap2.bam

fi
