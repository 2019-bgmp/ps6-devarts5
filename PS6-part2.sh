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
