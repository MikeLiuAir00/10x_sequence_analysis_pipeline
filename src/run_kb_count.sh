#!/usr/bin/env sh

ref_dir="$HOME/Code/10x_sequence_analysis_pipeline/ref"
working_dir="$HOME/Code/10x_sequence_analysis_pipeline"
samples="SRR7722938 SRR7722939 SRR7722940 SRR7722941 SRR7722942"

for sample in $samples; do

    # skip quantified samples
    if [[ -e "$working_dir/count_out_$sample" ]]; then
        echo "$sample exist, skip"
        continue
    fi

    # run kb count
    kb count \
    -i "$ref_dir/index_kb.idx" \
    -g "$ref_dir/t2g_kb.txt" \
    -x 10xv2 --h5ad \
    --umi-gene \
    --mm \
    -o "$working_dir/count_out_$sample" \
    -t 4 \
    -m 4G \
    --gene-names\
    --report \
    --keep-tmp \
    --overwrite \
    --verbose \
    "$working_dir/data/fastq/dumped/${sample}_2.fastq" \
    "$working_dir/data/fastq/dumped/${sample}_3.fastq" \
    1>run_kb_count_std_out.txt 2>run_kb_count_std_err.txt

done
