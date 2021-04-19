#!/bin/bash
#$ -S /bin/bash
#$ -N fastp
#$ -pe def_slot 4
#$ -cwd
#$ -o ./log
#$ -e ./log

cd /home/takeshik/tanomare/lectures/ddbj_lecture_2021apr21/mouse
module load singularity

files=( "SRR11966040" "SRR11966041" "SRR11966042"
        "SRR11966046" "SRR11966047" "SRR11966048" )

for f in ${files[@]}; do
  singularity exec /usr/local/biotools/f/fastp:0.20.1--h8b12597_0 fastp \
    -i ./rnaseq/${f}_s_1.fastq -I ./rnaseq/${f}_s_2.fastq -3 \
    -o ./rnaseq/${f}_s_1.fp.q15f15t1.fq.gz \
    -O ./rnaseq/${f}_s_2.fp.q15f15t1.fq.gz \
    -q 15 -n 10 -t 15 -T 1 -l 20 
done

# for f in ${files[@]}; do
#   singularity exec /usr/local/biotools/f/fastp:0.20.1--h8b12597_0 fastp \
#     -i ./rnaseq/${f}_1.fastq -I ./rnaseq/${f}_2.fastq -3 \
#     -o ./rnaseq/${f}_1.fp.q15f15t1.fq.gz -O ./rnaseq/${f}_2.fp.q15f15t1.fq.gz \
#     -q 15 -n 10 -t 15 -T 1 -l 20 
# done

