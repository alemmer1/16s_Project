#!/bin/bash

if [ "$1" == "index" ];
then
	bwa index ./16SMicrobial_zymoOnly.fasta

fi

if [ "$1" == "align" ] ;
then

	bwa mem -x ont2d ./16SMicrobial_zymoOnly.fasta ./170718_16s_zymoStandards.fq > bwamem_output_zymo_dbZymoOnly.sam

fi
