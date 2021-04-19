#!/bin/sh
#$ -S /bin/sh
#$ -cwd
#$ -l s_vmem=1G -l mem_req=1G -l short
#$ -pe def_slot 4
#$ -o out.log
#$ -e error.log

export GEA_HOME=/lustre7/singularity/images/gene_expression_analysis

module load singularity/3.5.2

singularity exec \
-B ${GEA_HOME}/refs:${GEA_HOME}/refs \
${GEA_HOME}/gene_expression_analysis.sif \
GeneExpressionAnalysisSimple.sh \
mm10_SRR11966040 \
mm10 \
./mouse/rnaseq/SRR11966040_s_1.fastq.gz \
./mouse/rnaseq/SRR11966040_s_2.fastq.gz

