#!/bin/sh 
#SBATCH --job-name="bolt"
#SBATCH --mail-user=<>
#SBATCH --mail-type=ALL
#SBATCH -o bolt.o%j
#SBATCH -e bolt.e%j
#SBATCH --partition="highmem"
#SBATCH -a 1-22

# Run lmm on all chromosomes to generate summ statistics to be used by bolt
../../../../BOLT-LMM_v2.4.1/bolt --bfile=ld_${SLURM_ARRAY_TASK_ID} \
        --phenoFile=/data3/mchopra/ukb_genotype_mri_passed/phenotypes/norm_pheno_aao.txt \
        --phenoCol=AAo_distensibility \
        --geneticMapFile=/data3/mchopra/BOLT-LMM_v2.4.1/tables/genetic_map_hg19_withX.txt.gz \
        --LDscoresFile=/data3/mchopra/BOLT-LMM_v2.4.1/tables/LDSCORE.1000G_EUR.tab.gz \
        --numThreads=${SLURM_ARRAY_TASK_ID} \
        --covarMaxLevels=100 \
        --statsFile=results/ao_GRM_bfile_${SLURM_ARRAY_TASK_ID} \
        --qCovarCol=PC{1:10} \
        --qCovarCol=CENTRE \
        --qCovarCol=BATCH \
        --qCovarCol=AGE \
        --covarCol=SEX \
        --qCovarCol=HEIGHT \
        --qCovarCol=WEIGHT \
        --qCovarCol=BMI \
        --qCovarCol=DBP \
        --qCovarCol=SBP \
        --covarFile=bolt_covars.txt \
        --sampleFile=/data3/mchopra/ukb_genotype_mri_passed/output/wbi_removedICD10/bgen/chr1.sample \
        --bgenFile=/data3/mchopra/ukb_genotype_mri_passed/output/wbi_removedICD10/bgen/chr${SLURM_ARRAY_TASK_ID}.bgen \
        --statsFileBgenSnps=results/ao_${SLURM_ARRAY_TASK_ID}.stats \
        --bgenMinMAF=1e-3 \
        --bgenMinINFO=0.3 \
        --LDscoresMatchBp \
        --lmm \
        --verboseStats \
        --numLeaveOutChunks 2 \
        --covarUseMissingIndic \
        --maxModelSnps 4000000


#awk 'NR==1{next} FNR==1 && NR!=1{next} 1' ao_1.stats ao_2.stats ao_3.stats ao_4.stats ao_5.stats ao_6.stats ao_7.stats ao_8.stats ao_9.stats ao_10.stats ao_11.stats ao_12.stats ao_13.stats ao_14.stats ao_15.stats ao_16.stats ao_17.stats ao_18.stats ao_19.stats ao_20.stats ao_21.stats ao_22.stats > ao_combined.stats

#make sure to add the below as header 
#SNP	CHR	BP	GENPOS	ALLELE1	ALLELE0	A1FREQ	INFO	CHISQ_LINREG	P_LINREG	BETA	SE	CHISQ_BOLT_LMM_INF	P_BOLT_LMM_INF
