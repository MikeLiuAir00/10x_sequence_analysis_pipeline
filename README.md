# 10x_sequence_analysis_pipeline

## Pipeline

![img](./src/CTM2-12-e694-g005.jpg)

- download data
    
    - sample fastq
      
    - sample-index list
      
      - [10x genomics sample index list][1]
          
- barcodes reads whitelist
      
      - [10x genomics barcode whitelist][2]
     
 - download reference data with annotation and pre-built index
      
          Human genome reference hg38 with annotation .gff file
      
          Human genome reference hg19 with annotation .gff file(X chromosome only)
- Sample Index + UMI + Barcode based sample from original data

    - Inspect sample index, UMI and barcode first
      
- Demultiplexing sample index and score-based quality control

    - Demultiplexing: Cell Ranger's mkfastq or Illumina's bcl2fastq 
    
- Align(or align free), barcode + UMI extraction, Quantification (/w kb_python)
    
    - 10x genomcis v2 '3: Read 1: 16 + 10(CB + UMI); Read 2: actual sequence
    
    - Filter the UMI + Barcode with quality-score > 10%, not homopolymers and carcode within 1-Hamming-distance. 
    
    - cell call, droplet-based quality control, normalization
    
- PCA analysis, clustering, marker gene extraction, differential analysis(/w scanpy)


## scRNA Sequence Frameworks

### Cell Ranger + seurat

### starSolo + MultiQC + DropletUtils + seurat

    - starSolo: Demultiplexing, Alignment, quantification
    
    starSolo is an alternative to Cell Ranger, which integrated cell call pipeline.
    
    - MultiQC: quality report
    - DropletUtils:  quality control(score-based, droplet-based)
    - seurat: downstream analysis(clustering...)
 
    
### salmon(alevin + simpleaf) + scanpy
    
    - alevin + simpleaf: demultiplexing, aligner, quantification
    
    salmon based framwork, features its quick and memory-saving aligner and alignment free
    quantification method.
        
    - scanpy: downstream analysis
      
    scanpy is an alternative scRNA seq analysis Python package to Seurat, which is in R.


### Kallisto + bustools + scanpy

    - kallisto + bustools(kb): demultiplexing, aligner, quantification
    
    kallisto is an fast and alignment-free program for quantifying scRNA-seq data. 
    kb is a workflow for pre-processing scRNA-seq data. It's tutorial is integrated with both
    Python and R code examples. With python API
    
    - scanpy: downstream analysis


        
    
Question:
    How sample index works
    
[1]: https://www.10xgenomics.com/support/single-cell-gene-expression/documentation/steps/sequencing/sample-index-sets-for-single-cell-3
      
[2]: https://github.com/10XGenomics/cellranger/tree/master/lib/python/cellranger/barcodes
