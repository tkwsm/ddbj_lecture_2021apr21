#!/bin/sh
#$ -S /bin/sh
#$ -cwd 
#$ -l short
#$ -l s_vmem=16G,mem_req=16G
#$ -pe def_slot 1
#$ -o ./log
#$ -e ./log

source ~/.bashrc
cd /home/takeshik/tanomare/lectures/ddbj_lecture_2021apr21/mouse

prefixarray=( ""
              "SRR11966040" "SRR11966041" "SRR11966042"
              "SRR11966046" "SRR11966047" "SRR11966048" )
f="${prefixarray[$SGE_TASK_ID]}"
singularity exec /usr/local/biotools/h/htseq:0.13.5--py38h1773678_0 htseq-count  -f bam ./output/${f}_s.fp.q15f15t1.snp_tran.sorted.bam ./db/mm10/Mus_musculus/Ensembl/GRCm38/Annotation/Genes/genes.gtf >./output/${f}_s.fp.q15f15t1.snp_tran.count


# singularity exec /usr/local/biotools/h/htseq:0.13.5--py38h1773678_0 htseq-count  -f bam ./output/${f}_s.fp.q15f15t1.tran.sorted.bam ./db/mm10/Mus_musculus/Ensembl/GRCm38/Annotation/Genes/genes.gtf >./output/${f}_s.fp.q15f15t1.tran.count

# singularity exec /usr/local/biotools/h/htseq:0.13.5--py38h1773678_0 htseq-count  -f bam ./output/${f}.fp.q15f15t1.snp_tran.sorted.bam ./db/mm10/Mus_musculus/Ensembl/GRCm38/Annotation/Genes/genes.gtf >./output/${f}.fp.q15f15t1.snp_tran.count


# singularity exec /usr/local/biotools/h/htseq:0.13.5--py38h1773678_0 htseq-count  -f bam ./output/${f}.fp.q15f15t1.tran.sorted.bam ./db/mm10/Mus_musculus/Ensembl/GRCm38/Annotation/Genes/genes.gtf >./output/${f}.fp.q15f15t1.tran.count


