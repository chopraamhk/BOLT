#!/bin/sh 
#SBATCH --job-name="QC"
#SBATCH -o qc.o%j
#SBATCH -e qc.e%j
#SBATCH --mail-user=>
#SBATCH --mail-type=ALL
#SBATCH --partition="highmem","normal"
#SBATCH -a 1-22

module load plink2

#code 
plink2 --bfile distensibility_c_${SLURM_ARRAY_TASK_ID} --mach-r2-filter 0.2 --maf 0.001 --geno 0.02 --hwe 0.0000005 midp --indep-pairwise 50 5 0.2 --rm-dup exclude-all list --make-bed --out QC_${SLURM_ARRAY_TASK_ID}
