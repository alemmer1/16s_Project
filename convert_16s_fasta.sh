#!/bin/bash

# Source: http://bioinformaticstips.com/2015/10/05/how-to-get-a-fasta-file-of-the-16s-rrna-database-from-ncbi/

# Converting NCBI 16s rRNA database into fasta format
blastdbcmd -db 16SMicrobial -out 16SMicrobial.fasta -outfmt %f -entry 'all'

# grep -c -P '>.+>' 16SMicrobial.fasta will show you that 250 sequences have 2 headers 

# Storing all lines with double headers
grep -P '>.+>' 16SMicrobial.fasta > 16SMicrobial_doubleheaders.txt

# Removing the secong header to get fasta format
perl -p -i.bak -e 's/(>[^>]+).*/$1/' 16SMicrobial.fasta

# grep -c -P '>.+>' 16SMicrobial.fasta will show you that now 0 sequences have 2 headers
