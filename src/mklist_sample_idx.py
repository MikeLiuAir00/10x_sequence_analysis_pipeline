#!/usr/bin/env python3
# mklist_sample_idx.py
#
# Script to faltten the original sample index file in .json or .csv
#
# Original format:
#
#   sample_name_1, index1, index2, index3, index4
#
#   or
#
#   [
#       Sample_name:{
#           index1,
#           index2,
#           index3,
#           index4
#       }
#   ]


import argparse
from io import TextIOWrapper
from pathlib import Path


# Needed Path
#   add config.py later
HOME = str(Path.home())
WORKING_DIR = HOME + "/Code/10x_sequence_analysis_pipeline/"
OUT_DIR = HOME + "/Code/10x_sequence_analysis_pipeline/"


def flatten_csv(f: TextIOWrapper, out: str):
    out_list = []
    for line in f:
        sample_name, *idx = line.strip('\n').split(sep=',')
        out_list += list(map(lambda x: sample_name + '\t' + x, idx))

    with open(out, "w") as outf:
        outf.write('\n'.join(out_list))


def flatten_json():
    pass



if __name__ == '__main__':

    parser = argparse.ArgumentParser(description='Flatten the given .csv or .json file to .tsv file with sample index')
    parser.add_argument('-i',
                        dest="sample_idx",
                        type=str,
                        required=True,
                        help='Target sampel index file in .json or .csv'
                        )
    parser.add_argument("-o",
                        dest="out",
                        type=str,
                        required=True,
                        help="output file")
    args = parser.parse_args()


    with open(WORKING_DIR + args.sample_idx, "r") as sample_idx_csv:
        flatten_csv(sample_idx_csv, OUT_DIR + args.out)
