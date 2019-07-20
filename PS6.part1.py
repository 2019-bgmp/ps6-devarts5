#!/usr/bin/env python

# Note that the length and coverage information provided in the header of
# each contig should therefore be understood in k-mers and in k-mer coverage (cf.
# 5.2) respectively. E.g. for a 500bp contig and a k-mer length of 21, the length
# in the header will be 480.

import re
kmer_length_file = []
kmer_coverage_file = []
file= "/home/devarts/bgmp/Bi621/PSs/PS6/contigs.fa"
#with open(file,"r") as fh:
    #for line in fh:
    #    if line[0] == ">":
            #print(line)
            # >NODE_3442_length_1205_cov_73.570953





st = ">NODE_3442_length_1205_cov_73.570953"
st = ">NODE_3442_length_12066_cov_74.570953"
kmer_groups = re.match(">NODE_\d+_length_(\d+)_cov_(\d+\.\d+)",st)
kmer_length = kmer_groups.groups()[0]
kmer_coverage = kmer_groups.groups()[1]
print(kmer_length,kmer_coverage)            #kmer_length_file[line]=kmer_length
