#!/usr/bin/env sh

base_path="$HOME/Code/10x_sequence_analysis_pipeline/"
sample_idx='sample_idx.tsv'
fastq="$HOME/Data/fastq/SRR7722942.fastq"

demultiplex demux -r -e 8 $base_path$sample_idx $fastq -p ./data/fastq
