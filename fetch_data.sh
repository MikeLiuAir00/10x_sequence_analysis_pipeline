#!/bin/bash
# fetch_data.sh
#
# Download sra data from NCBI database
# from SRR7722937 to SRR7722942

filename_prefix="SRR77229"

for ((i=37;i<=42;i++))
do
         prefetch -v $filename_prefix$i
         echo "-------------------------------------"
done
