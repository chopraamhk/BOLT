#!/bin/bash
#
#SBATCH --job-name="score_ao"
#SBATCH -o score_ao.o%j
#SBATCH -e score_ao.e%j
#SBATCH --mail-user=<>
#SBATCH --mail-type=ALL
#SBATCH --partition="normal","highmem"

module load Anaconda3/2024.02-1
conda activate plink
plink --bfile ../c_1_22 --score merged_aao_effect.txt 1 5 7 sum --out aao_score

#1 - SNP column
#5 - Allele1 
#7 - effect
