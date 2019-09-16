#Part1
#!/bin/bash
#SBATCH --account=bgmp          ### SLURM account
#SBATCH --partition=bgmp        ### Partition
#SBATCH --job-name=PS6-part2     ### Job Name
#SBATCH --output=slurm-%j-%x.out         ### output log
#SBATCH --time=0-10:00:00       ### time estimate
#SBATCH --nodes=1               ### Node count required (default)
#SBATCH --ntasks-per-node=1     ### Number of tasks (default)
#SBATCH --cpus-per-task=7


conda deactivate
conda deactivate
conda deactivate

conda activate bgmp_py3

make 'CATEGORIES=4' 'MAXKMERLENGTH=50' 'OPENMP=1' 'LONGSEQUENCES=1' 'BUNDLEDZLIB=1'
mkdir -p $PREFIX/bin
cp velvetg velveth $PREFIX/bin

#Part2 - Python
#!/usr/bin/env python


'''
From velvet manual:
"Note that the length and coverage information provided in the header of
each contig should therefore be understood in k-mers and in k-mer coverage (cf.
5.2) respectively. E.g. for a 500bp contig and a k-mer length of 21, the length
in the header will be 480.""

#Alter K-mer length for various k-mer sizes
contig_length = 500
kmer_length = 21
contig_kmer_length (ie in the header) = 480

480 = (500- (21-1))
contig_kmer_length = (contig_length -(kmer_length-1))

'''

#get reg-ex
import re
#kmer length assigned
KMER_LENGTH = 31

contig_lengths =[]
file= "/home/devarts/bgmp/Bi621/PSs/ps6-devarts5/contigs.fa"
with open(file,"r") as fh:
    for line in fh:
        if line[0] == ">":
#Calculate contig length using velvet conversion contig length = given velvet length + (kmer length -1)
#Reg-ex to get velvet contig length
            kmer_groups = re.match(">NODE_\d+_length_(\d+)_cov_(\d+\.\d+)", line)
            contig_kmer_length = int(kmer_groups.groups()[0])
            contig_kmer_coverage = float(kmer_groups.groups()[1])
            contig_length = contig_kmer_length + (KMER_LENGTH - 1)
            contig_lengths.append(contig_length)
            contig_lengths = sorted(contig_lengths,key=int,reverse=True)

#Calculate number of contigs, max. contig length, total genome length & Mean contig length
    number_of_contigs = len(contig_lengths)
    max_contig_length = contig_lengths[0]
    Total_genome_length = sum(contig_lengths)
    Mean_contig_length = Total_genome_length/number_of_contigs

    #Caculate N50
    summed_length = 0
    mid_point = Total_genome_length/2
    for contig_length in contig_lengths:
        summed_length += contig_length
        if summed_length >= mid_point:
                N50 = contig_length
                break

#print data
print(contig_lengths)
print("Number of contigs =", number_of_contigs)
print("Max. Contig Length =", max_contig_length)
print("Total genome Length =", Total_genome_length)
print("Mean Contig Length =", Mean_contig_length)
print("N50 =", N50)
# kmer_length =
# Building buckets
bucket_list = {}
for i in contig_lengths:
    bucket = i//100*100
    #print(bucket)
    if i not in bucket_list:
        bucket_list[bucket]=1
    else:
        bucket_list[bucket]+=1

print("# Contig Length    Number of Contigs in this Category")
#printing bucket list
for entry in bucket_list:
    contig = entry
    value = bucket_list[entry]
    print(contig,         value)
