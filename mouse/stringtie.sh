#!/bin/bash
#$ -S /bin/bash
#$ -N stringtie
#$ -pe def_slot 4
#$ -cwd
#$ -o ./log
#$ -e ./log

module load singularity

files=( "SRR11966040" "SRR11966041" "SRR11966042"
        "SRR11966046" "SRR11966047" "SRR11966048" )

gtf="/home/takeshik/tanomare/lectures/ddbj_lecture_2021apr21/mouse/db/mm10/Mus_musculus/Ensembl/GRCm38/Annotation/Archives/archive-current/Genes/genes.gtf"

for f in ${files[@]}; do
  mkdir ballgown_s_snp_tran
  mkdir ballgown_s_snp_tran/${f}
  singularity exec /usr/local/biotools/s/stringtie:2.1.4--h7e0af3c_0 stringtie -e -B -p 4 -G ${gtf} -o ballgown_s_snp_tran/${f}/${f}.gtf ./output/${f}_s.fp.q15f15t1.snp_tran.sorted.bam
done


# for f in ${files[@]}; do
#    mkdir ballgown_s_tran
#    mkdir ballgown_tran
#    mkdir ballgown_snp_tran
# 
#    mkdir ballgown_s_tran/${f}
#    mkdir ballgown_tran/${f}
#    mkdir ballgown_snp_tran/${f}
# 
#    singularity exec /usr/local/biotools/s/stringtie:2.1.4--h7e0af3c_0 stringtie -e -B -p 4 -G ${gtf} -o ballgown_is_tran/${f}/${f}.gtf     ./output/${f}_s.fp.q15f15t1.tran.sorted.bam
# 
# 
#    singularity exec /usr/local/biotools/s/stringtie:2.1.4--h7e0af3c_0 stringtie -e -B -p 4 -G ${gtf} -o ballgown_tran/${f}/${f}.gtf        ./output/${f}.fp.q15f15t1.tran.sorted.bam
# 
#    singularity exec /usr/local/biotools/s/stringtie:2.1.4--h7e0af3c_0 stringtie -e -B -p 4 -G ${gtf} -o ballgown_snp_tran/${f}/${f}.gtf    ./output/${f}.fp.q15f15t1.snp_tran.sorted.bam
# 
# done

