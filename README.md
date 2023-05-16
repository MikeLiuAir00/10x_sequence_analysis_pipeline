# 10x_sequence_analysis_pipeline

## Pipeline

![img](./static/CTM2-12-e694-g005.jpg)

- download data
    
    - sample fastq
    
      The result generated are all based on patient PBMC data(run:SRR7722942)
      
    - sample-index list
      
      - [10x genomics sample index list][1]
          
    - barcodes reads whitelist
      
      - [10x genomics barcode whitelist][2]
      
      - kb_python has built-in barcode whitelist. Check supported seq tech use `kb --list`.
     
- download reference data with annotation and pre-built index

    - download and build /w kb_python
    
    - Or download pre-built index /w kb_python
      
      The current result is based on pre-built index from kb_python. The pre-built index is based on Ensembl v96
      transcriptome.
 
      
- Inspecting Sample Index + UMI + Barcode based sample from original data
    
    - 10x genomics Chromium v2 3' chemical UMI + Barcode position
      
      - sample index -> 8
      
      - CB + UMI -> 16 + 10 (26)
      
      - reads -> 98
    
      
- Demultiplexing sample index and score-based quality control

    - reformat the sampel index .csv/.json file to meet software-wise requirement

    - Demultiplexing: Cell Ranger's mkfastq or Illumina's bcl2fastq
      
      - for now demultiplex python software
        
        Since the sample data are all from the same sample index, demultiplexing only generate one file(SI-GA-A6)
    
- Align(or align free), barcode + UMI extraction, Quantification (/w kb_python)
    
    - 10x genomcis v2 '3: Read 1: 16 + 10(CB + UMI); Read 2: actual sequence
    
    - Filter the UMI + Barcode with quality-score > 10%, not homopolymers and carcode within 1-Hamming-distance(done by bustools correct). 
    
    
- PCA analysis, clustering, marker gene extraction, differential analysis(/w scanpy)

  - cell call, droplet-based quality control
    
    The cells are filtered based on umi count and knee point
  
  - Nornmalization
    
    Normalization is performed as described below:
      
    UMI counts were scaled by the total number of UMI in each cell and multiplied by the median of the total UMI counts across cells. The data were then log2-transformed
    
  - Highly variable genes are detected with scanpy function
  
  - Clustering , PCA and tSNE
  
    The data are then clustered with louvain method with resolution = 0.6. tSNE visualized top 10 pcs in 2d space.

      
    

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


### Kallisto + bustools + scanpy (current)

  - kallisto + bustools(kb): demultiplexing, aligner, quantification
    
    kallisto is an fast and alignment-free program for quantifying scRNA-seq data.
    bustools is .bus file(binary) manipulation module
    kb is a Python module which provide workflow built with kallisto and bustools for pre-processing scRNA-seq data.  
    
  - scanpy: downstream analysis


        
    
    
[1]: https://www.10xgenomics.com/support/single-cell-gene-expression/documentation/steps/sequencing/sample-index-sets-for-single-cell-3
      
[2]: https://github.com/10XGenomics/cellranger/tree/master/lib/python/cellranger/barcodes
