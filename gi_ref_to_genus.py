# Given a list of gi and reference accession numbers in the format gi|*|ref|*|
# this prorgam will search the NCBI 16S Micbrobial database previously converted into fasta
# format and output the corresponding species

#!/usr/bin/env python2

import sys

# Creates a dictionary from the NCBI 16SMicrobial database in fasta format where the keys are
# gi|*|ref|*| and the values are the species name
def createDict(input_db):
	accnum_with_species = {}
	with open(input_db, "r") as fl:
		for line in fl:
			if line[0] == ">":
				line = line[1:]
				key = line.split()
				key = key[0]
				value = line.split("|")
				value = value[4].strip()
				value = value.split()
				value = value[0]
				if key not in accnum_with_species:
					accnum_with_species[key] = value
	return accnum_with_species

# Given a list of gi and ref numbers in the format gi|*|ref|*|, look them up in the dictionary
# and get corresponding species name
def findHits(species_dict, accNums_file):
	results = {}
	tot_hits = 0
	with open(accNums_file, "r") as fl:
		for line in fl:
			tot_hits += 1
			curr_sp = species_dict[line.strip()]
			if curr_sp in results:
				results[curr_sp] += 1
			else:
				results[curr_sp] = 1
	return (results, tot_hits)

def main():
	accNum_Species_Dict = createDict(sys.argv[1])
	found = findHits(accNum_Species_Dict, sys.argv[2])
	results = found[0]
	tot_hits = found[1]
	for key, value in results.iteritems():
		print key + "\t" + str(value) + "\t" + str(float(value)*100/649486) #hrad coded tot num of reads to make graphs for lab mtg

if __name__ == "__main__":
	main()
