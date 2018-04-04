#!/bin/bash

# Converting NCBI 16s rRNA database into fasta format
blastdbcmd -db 16SMicrobial -out 16SMicrobial_test.fasta -outfmt %f -entry 'all'

# grep -c -P '>.+>' 16SMicrobial.fasta will show you that 250 sequences have 2 headers 

# Storing all lines with double headers
grep -P '>.+>' 16SMicrobial_test.fasta > 16SMicrobial_doubleheaders.txt

# Removing the secong header to get fasta format
perl -p -i.bak -e 's/(>[^>]+).*/$1/' 16SMicrobial_test.fasta

# grep -c -P '>.+>' 16SMicrobial.fasta will show you that now 0 sequences have 2 headers
