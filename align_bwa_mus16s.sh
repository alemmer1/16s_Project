#!/bin/bash

if [ "$1" == "index" ];
then
	bwa index ./16SMicrobial_removedNewLines.fasta

fi

if [ "$1" == "align" ] ;
then

	dir=/dilithium/Data/Nanopore/Analysis/alemmer/mus16s_samples
	fq=sample.38.202
	ref=./16SMicrobial_removedNewLines.fasta

	bwa mem -x ont2d ${ref} ${dir}/${fq}.fq.gz > bwamem_${fq}.sam

fi
