#!/bin/bash
#$ -S /bin/bash
#$ -N hisat2
#$ -pe def_slot 4
#$ -cwd
#$ -o ./log
#$ -e ./log

module load singularity

files=( "SRR11966040" "SRR11966041" "SRR11966042"
        "SRR11966046" "SRR11966047" "SRR11966048" )

for f in ${files[@]}; do
  singularity exec /usr/local/biotools/h/hisat2\:2.1.0--py36pl5.22.0_0 hisat2 \
  -p 4 -x ./grcm38_snp_tran/genome_snp_tran --dta \
  -1 ./rnaseq/${f}_s_1.fp.q15f15t1.fq       \
  -2 ./rnaseq/${f}_s_2.fp.q15f15t1.fq       \
  -S ./output/${f}_s.fp.q15f15t1.snp_tran.sam
done

for f in ${files[@]}; do
  singularity exec /usr/local/biotools/h/hisat2\:2.1.0--py36pl5.22.0_0 hisat2 \
    -p 4 -x ./grcm38_tran/genome_tran --dta \
    -1 ./rnaseq/${f}_1.fp.q15f15t1.fq       \
    -2 ./rnaseq/${f}_2.fp.q15f15t1.fq       \
    -S ./output/${f}.fp.q15f15t1.tran.sam
done

for f in ${files[@]}; do
  singularity exec /usr/local/biotools/h/hisat2\:2.1.0--py36pl5.22.0_0 hisat2 \
    -p 4 -x ./grcm38_snp_tran/genome_snp_tran --dta \
    -1 ./rnaseq/${f}_1.fp.q15f15t1.fq       \
    -2 ./rnaseq/${f}_2.fp.q15f15t1.fq       \
    -S ./output/${f}.fp.q15f15t1.snp_tran.sam
done

for f in ${files[@]}; do
  singularity exec /usr/local/biotools/h/hisat2\:2.1.0--py36pl5.22.0_0 hisat2 \
  -p 4 -x ./grcm38_snp_tran/genome_tran --dta \
  -1 ./rnaseq/${f}_s_1.fp.q15f15t1.fq       \
  -2 ./rnaseq/${f}_s_2.fp.q15f15t1.fq       \
  -S ./output/${f}_s.fp.q15f15t1.tran.sam
done


