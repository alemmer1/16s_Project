#!/bin/bash

# This throws one warning per sequence in query because one of the output format flags isn't supported.
# Is not an issue for the output or analysis later, but will fix at some point.

blastn -query 170718_16s_zymoStandards_2000reads.fa -out check.blastn.txt -db 16SMicrobial -outfmt '7 qseqid sseqid evalue bitscore sgi sacc sscinames scomnames stitle' -max_target_seqs 1
