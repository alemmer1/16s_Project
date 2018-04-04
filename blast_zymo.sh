#!/bin/bash

# Tried a few different versions of this, couldn't find a format that had a parseable output
# that still contained the species name 

blastn -query 170718_16s_zymoStandards_2000reads.fa -out ouput_zymo2000.blastn.txt -db 16SMicrobial -outfmt 7 -max_target_seqs 2
