#!/usr/bin/env python


'''
Note that the length and coverage information provided in the header of
each contig should therefore be understood in k-mers and in k-mer coverage (cf.
5.2) respectively. E.g. for a 500bp contig and a k-mer length of 21, the length
in the header will be 480.

contig_length = 500
kmer_length = 21
contig_kmer_length (ie in the header) = 480

480 = (500- (21-1))

contig_kmer_length = (contig_length -(kmer_length-1))
contig_length + contig_kmer_length = kmer_length-1
contig_kmer_length-(kmer_length-1)= -contig_length
contig_kmer_length-kmer_length+1 = -contig_length
'''


import re

KMER_LENGTH = 49

contig_lengths =[]
kmer_length_file = []
kmer_coverage_file = []
file= "/home/devarts/bgmp/Bi621/PSs/ps6-devarts5/contigs.fa"
with open(file,"r") as fh:
    for line in fh:
        if line[0] == ">":
            #print(line)
            # >NODE_3442_length_1205_cov_73.570953
            kmer_groups = re.match(">NODE_\d+_length_(\d+)_cov_(\d+\.\d+)", line)
            contig_kmer_length = int(kmer_groups.groups()[0])
            contig_kmer_coverage = float(kmer_groups.groups()[1])
            #kmer_length_file
        #for nucleotide in line:
            #if nucleotide[0] == "A" or "T" or "C" or "G":
            #contig_length +=1
            # contig_length =
            contig_length = contig_kmer_length + (KMER_LENGTH - 1)
            #print(contig_length, contig_kmer_coverage)
            contig_lengths.append(contig_length)
            contig_lengths = sorted(contig_lengths,key=int,reverse=True)

    number_of_contigs = len(contig_lengths)
    max_contig_length = contig_lengths[0]
    Total_contig_length = sum(contig_lengths)
    Mean_contig_length = Total_contig_length/number_of_contigs

print(contig_lengths)
print("Number of contigs =", number_of_contigs)
print("Max. Contig Length =", max_contig_length)
print("Length of total contigs =", Total_contig_length)
print("Mean Contig Length =", Mean_contig_length)

# kmer_length =





# st = ">NODE_3442_length_1205_cov_73.570953"
# st = ">NODE_3442_length_12066_cov_74.570953"
# kmer_groups = re.match(">NODE_\d+_length_(\d+)_cov_(\d+\.\d+)",st)
# kmer_length = kmer_groups.groups()[0]
# kmer_coverage = kmer_groups.groups()[1]
# print(kmer_length,kmer_coverage)            #kmer_length_file[line]=kmer_length
