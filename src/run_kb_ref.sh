#!/usr/bin/env sh


ref_dir="$HOME/Code/10x_sequence_analysis_pipeline/ref"
working_dir="$HOME/Code/10x_sequence_analysis_pipeline"

kb ref \
    --verbose \
    -i "$ref_dir/index_whole.idx" \
    -g "$ref_dir/t2g_whole.txt" \
    -f1 "$ref_dir/trancriptome_whole.fa" \
    "$working_dir/data/GCF_000001405.40.zip" \
    "$working_dir/data/GCF_000001405.40_GRCh38.p14_genomic.gtf.gz" \
    1>run_kb_ref_std_out.txt 2>run_kb_ref_std_err.txt
