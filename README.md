# 10x_sequence_analysis_pipeline

## Pipeline

![img](./src/CTM2-12-e694-g005.jpg)

    - download data
    
      - sample fastq
      
      - sample-index list
      
          ![10x genomics sample index                       list](https://www.10xgenomics.com/support/single-cell-gene-expression/documentation/steps/sequencing/sample-index-sets-for-single-cell-3)
      
      - barcodes reads whitelist

        ![10x genomics barcode whitelist](https://github.com/10XGenomics/cellranger/tree/master/lib/python/cellranger/barcodes)
     
      - download reference data with annotation and pre-built index
      
          Human genome reference hg38 with annotation .gff file
      
          Human genome reference hg19 with annotation .gff file(X chromosome only)
       
    - Demultiplexing sample index and score-based quality control
    
    - Align(or align free), barcode + UMI extraction, Quantification
    
        10x genomcis v2 '3: Read 1: 16 + 10(CB + UMI); Read 2: actual sequence 
    
    - cell call, droplet-based quality control, normalization
    
    - PCA analysis, clustering, marker gene extraction, differential analysis


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
    Python and R code examples.
    
    - scanpy: downstream analysis




Requirement:
    <!-- salmon -->
    <!-- alevin-fry -->
    <!--     Single-Cell processing framework -->
    <!-- simpleaf -->
    <!--     Simplified cmd-line tool interface for alevin-fry -->
    STARsolo or simpleaf
        demultiplexing
        quantification
    MultiQC
        Quality quality
    Quality Count Matrix
        
    
Question:
    use salmon
    confirm the 10x reads
        1. 3 files 
           - 1: unknown 
           - 2: barcode + UMI
           - 3: read2
    
    
