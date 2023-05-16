#!/usr/bin/env sh


ref_dir="$HOME/Code/10x_sequence_analysis_pipeline/ref"

kb ref \
    --verbose \
    -d human \
    -i "$ref_dir/index_kb.idx" \
    -g "$ref_dir/t2g_kb.txt" \
    -f1 "$ref_dir/trancriptome.fa" \
    1>run_kb_ref_std_out.txt 2>run_kb_ref_std_err.txt
