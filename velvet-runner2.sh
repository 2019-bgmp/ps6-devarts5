#!/bin/bash
#SBATCH --account=bgmp          ### SLURM account
#SBATCH --partition=bgmp        ### Partition
#SBATCH --job-name=PS6-velveth 49     ### Job Name
#SBATCH --output=slurm-%j-%x.out         ### output log
#SBATCH --time=0-01:00:00       ### time estimate
#SBATCH --nodes=1               ### Node count required (default)
#SBATCH --ntasks-per-node=1     ### Number of tasks (default)
#SBATCH --cpus-per-task=7

conda deactivate
conda deactivate
conda deactivate

conda activate bgmp_py3

/usr/bin/time -v
velveth output-49.out. 49 -fastq -shortPaired -separate 800_3_PE5_interleaved.fq_1 800_3_PE5_interleaved.fq_2 -short 800_3_PE5_interleaved.fq.unmatched
