# Input prep and alignment
# P2i platform
zcat /data/gDNA_library/gDNA_230_OM/20250128_1405_P2I-00111-B_PBA57099_5dcfbf6c/fastq_pass/*.fastq.gz > /data/sample_230_OM.fastq 
# Quality control before alignment 
NanoPlot -t 60 --fastq sample_230_OM.fastq  --outdir Nanoplot_230_OM --plots hex dot
filtlong --min_length 1000 --keep_percent 90 sample_230_OM.fastq > sample_230_OM.filtered.fastq

# Alignment
minimap2 -t 60 -ax map-ont /home/nasslab/ref/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna  sample_230_OM.filtered.fastq  > sample_230_OM_aln.sam

# QC after alignment 
samtools view -S -b sample_230_OM_aln.sam > sample_230_OM.bam
samtools sort --threads 64 -o sample_230_OM.sorted.bam sample_230_OM.bam
samtools index sample_230_OM.sorted.bam

# depth sequencing moshdepth
mosdepth -t 60 -n --fast-mode --by 500 --d4 sample_230_OM.wgs sample_230_OM.sorted.bam


#### Variant Calling
sniffles -t 60 --reference /home/nasslab/ref/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna -i sample_230_OM.sorted.bam -v sample_230_OM.sniffles.vcf
svim alignment sample_230_OM sample_230_OM.sorted.bam /home/nasslab/ref/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna

#### snpEff variant annotation
java -Xmx8g -jar snpEff.jar GRCh38.99 sample_230_OM.sniffles.vcf > sample_230_OM.sniffles.ann.vcf
java -Xmx8g -jar snpEff.jar GRCh38.99 sample_230_OM.svim.vcf > sample_230_OM.svim.ann.vcf





