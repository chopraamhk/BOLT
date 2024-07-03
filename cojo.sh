#!/bin/sh 
#SBATCH --job-name="cojo_ao"
#SBATCH --mail-user=<>
#SBATCH --mail-type=ALL
#SBATCH -o cojo.o%j
#SBATCH -e cojo.e%j
#SBATCH --partition="highmem","normal"
#SBATCH -a 1-22

../../gcta-1.94.1-linux-kernel-3-x86_64/gcta64 --bfile /data3/mchopra/ukb_genotype_mri_passed/output/wbi_removedICD10/c_${SLURM_ARRAY_TASK_ID} --chr ${SLURM_ARRAY_TASK_ID} --maf 0.01 --cojo-file ../../results_ascending/ao_cojo_input.ma --cojo-slct --out cojo_out_${SLURM_ARRAY_TASK_ID}
