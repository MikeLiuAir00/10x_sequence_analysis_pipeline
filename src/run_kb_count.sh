#!/usr/bin/env sh

ref_dir="$HOME/Code/10x_sequence_analysis_pipeline/ref"
working_dir="$HOME/Code/10x_sequence_analysis_pipeline"
kb count \
    -i "$ref_dir/index_kb.idx" \
    -g "$ref_dir/t2g_kb.txt" \
    -x 10xv2 --h5ad \
    -o "$working_dir/count_out" \
    -t 4 \
    "$working_dir/data/fastq/dumped/SRR7722942_2.fastq" \
    "$working_dir/data/fastq/dumped/SRR7722942_3.fastq" \
    1>run_kb_count_std_out.txt 2>run_kb_count_std_err.txt
