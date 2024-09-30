#!/bin/bash
#
#SBATCH --job-name="recodeA"
#SBATCH -o recode_A.o%j
#SBATCH -e recode_A.e%j
#SBATCH --mail-user=m.chopra1@universityofgalway.ie
#SBATCH --mail-type=ALL
#SBATCH --partition="highmem"
#SBATCH -n 32
#SBATCH -N 1

module load anaconda3/2024.02-1
conda activate plink

##The --recodeAD option produces both an additive and dominance coding: use --recodeA instead to skip the SNP_HET coding.
plink --bfile ld_1_22 --recodeA --out recodeA


##head -n 5 recodeA.raw | cut -d ' ' -f 1-10
##if want to see the header
