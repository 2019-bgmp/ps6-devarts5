#!/bin/bash
#SBATCH --account=bgmp          ### SLURM account
#SBATCH --partition=bgmp        ### Partition
#SBATCH --job-name=velvetg 49      ### Job Name
#SBATCH --output=slurm-%j-%x.out         ### output log
#SBATCH --time=0-10:00:00       ### time estimate
#SBATCH --nodes=1               ### Node count required (default)
#SBATCH --ntasks-per-node=1     ### Number of tasks (default)
#SBATCH --cpus-per-task=1       ### Number

conda deactivate
conda deactivate
conda deactivate

conda activate bgmp_py3

/usr/bin/time -v velvetg output-49.out.
