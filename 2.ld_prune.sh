#!/bin/sh
#SBATCH --job-name="prune"
#SBATCH --mail-user=<>
#SBATCH --mail-type=ALL
#SBATCH -o prune.o%j
#SBATCH -e prune.e%j
#SBATCH --partition="highmem","normal"
#SBATCH -a 1-22

module load plink2 
plink2 --bfile chr_${SLURM_ARRAY_TASK_ID} --extract chr_${SLURM_ARRAY_TASK_ID}.prune.in --make-bed --out ld_${SLURM_ARRAY_TASK_ID}
