#!/bin/sh 
#SBATCH --job-name="reml_ao"
#SBATCH --mail-user=<>
#SBATCH --mail-type=ALL
#SBATCH -o r_ao.o%j
#SBATCH -e r_ao.e%j
#SBATCH --partition="highmem"
#SBATCH -a 1-22

# Run lmm on all chromosomes to generate summ statistics to be used by bolt
../../../../../BOLT-LMM_v2.4.1/bolt \
    --bfile=/data3/mchopra/ukb_genotype_mri_passed/prune_wbi_icd10/ld_${SLURM_ARRAY_TASK_ID} \
    --phenoFile=/data3/mchopra/ukb_genotype_mri_passed/phenotypes/norm_pheno_aao.txt \
    --phenoCol=AAo_distensibility \
    --geneticMapFile=/data3/mchopra/BOLT-LMM_v2.4.1/tables/genetic_map_hg19_withX.txt.gz \
    --LDscoresFile=/data3/mchopra/BOLT-LMM_v2.4.1/tables/LDSCORE.1000G_EUR.tab.gz \
    --reml \
    --numThreads=32 \
    --covarMaxLevels=200 \
    --qCovarCol=PC{1:10} \
    --covarCol=CENTRE \
    --covarCol=BATCH \
    --qCovarCol=AGE \
    --covarCol=SEX \
    --qCovarCol=HEIGHT \
    --qCovarCol=WEIGHT \
    --qCovarCol=BMI \
    --qCovarCol=DBP \
    --qCovarCol=SBP \
    --covarFile=../bolt_covars.txt \
    --LDscoresMatchBp \
    --verboseStats \
    --covarUseMissingIndic \
    --maxModelSnps 4000000 \
   2>&1 | tee o_${SLURM_ARRAY_TASK_ID}.log 
