#!/bin/bash
#$ -S /bin/bash
#$ -N samtools
#$ -l short
#$ -pe def_slot 4
#$ -cwd
#$ -o ./log
#$ -e ./log

module load singularity

files=( "SRR11966040" "SRR11966041" "SRR11966042"
        "SRR11966046" "SRR11966047" "SRR11966048" )

for f in ${files[@]}; do

  singularity exec /usr/local/biotools/s/samtools\:1.9--h91753b0_8 samtools view -Sb ./output/${f}_s.fp.q15f15t1.snp_tran.sam >./output/${f}_s.fp.q15f15t1.snp_tran.bam
  singularity exec /usr/local/biotools/s/samtools\:1.9--h91753b0_8 samtools sort -@ 4 -o ./output/${f}_s.fp.q15f15t1.snp_tran.sorted.bam ./output/${f}_s.fp.q15f15t1.snp_tran.bam

done


# for f in ${files[@]}; do

#    singularity exec /usr/local/biotools/s/samtools\:1.9--h91753b0_8 samtools view -Sb ./output/${f}.fp.q15f15t1.tran.sam >./output/${f}.fp.q15f15t1.tran.bam
#    singularity exec /usr/local/biotools/s/samtools\:1.9--h91753b0_8 samtools view -Sb ./output/${f}.fp.q15f15t1.snp_tran.sam >./output/${f}.fp.q15f15t1.snp_tran.bam
#    singularity exec /usr/local/biotools/s/samtools\:1.9--h91753b0_8 samtools view -Sb ./output/${f}_10k.fp.q15f15t1.tran.sam >./output/${f}_10k.fp.q15f15t1.tran.bam

#   singularity exec /usr/local/biotools/s/samtools\:1.9--h91753b0_8 samtools sort -@ 4 -o ./output/${f}.fp.q15f15t1.tran.sorted.bam ./output/${f}.fp.q15f15t1.tran.bam
#   singularity exec /usr/local/biotools/s/samtools\:1.9--h91753b0_8 samtools sort -@ 4 -o ./output/${f}.fp.q15f15t1.snp_tran.sorted.bam ./output/${f}.fp.q15f15t1.snp_tran.bam
#   singularity exec /usr/local/biotools/s/samtools\:1.9--h91753b0_8 samtools sort -@ 4 -o ./output/${f}_10k.fp.q15f15t1.tran.sorted.bam ./output/${f}_10k.fp.q15f15t1.tran.bam

# done

