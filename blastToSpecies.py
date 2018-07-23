# The purpose of this program is to get a list of species from blast output (format 7) and output a list
# of species and genus and their relative percentages in the sample

#!/usr/bin/python2

import sys

input_file = sys.argv[1]

def getSpecies(input_file):
	species = {}
	genus = {}
	tot_hits = 0
	# Reading blast output and getting the genus and species for each hit
	with open(input_file, "r") as f:
		 for line in f:
			if line[0] != "#":
				tot_hits += 1
				line = line.strip()
				line = line.split("\t")
				subject_title = line[8].strip()
				subject_title = subject_title.split()
				subject_genus = subject_title[0].strip()
				subject_species = subject_genus + " " + subject_title[1].strip()
				if subject_genus in genus:
					genus[subject_genus] += 1
				else:
					genus[subject_genus] = 1
				if subject_species in species:
					species[subject_species] += 1
				else:
					species[subject_species] = 1
	return (species, genus, tot_hits)

(species, genus, tot_hits) = getSpecies(input_file)
# Printing the species and genus seen in the sample and their relative percentages
for key, value in species.iteritems():
	print key + "\t" + str(value) + "\t" + str(float(value)*100/tot_hits)
for key, value in genus.iteritems():
	print key + "\t" + str(value) + "\t" + str(float(value)*100/tot_hits)
