#!/bin/bash

if [ "$1" == "index" ];
then
	bwa index ./16SMicrobial_removedNewLines.fasta

fi

if [ "$1" == "align" ] ;
then
	samples='36 37 38 44 45 46'
	dir=/dilithium/Data/Nanopore/Analysis/alemmer/mus16s_samples
	ref=./16SMicrobial_removedNewLines.fasta
	
	for sample in $samples
	do
		bwa mem -x ont2d ${ref} ${dir}/sample.${sample}.202.fq.gz > bwamem_sample.${sample}.202.sam
	done

fi
