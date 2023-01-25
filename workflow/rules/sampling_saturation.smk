#-------------------------------------------------------------------------------
# 
#   Snakefile to perform saturation / rarefaction of fastq sequence files
#
#     Author: Rene Welch rwelch2@wisc.edu
#
#------------------------------------------------------------------------------#

rule sample_sequences:
  """
  Sample sequences from the fastq file that were subsetted to overlapping the
  TRB loci
  """
  input:
    r1= lambda wc: sample_dict[wc.sample]["end1"],
    r2= lambda wc: sample_dict[wc.sample]["end2"]
  output:
    r1="output/saturation/{seed}/{perc}/fastq/{sample}_R1.fastq.gz",
    r2="output/saturation/{seed}/{perc}/fastq/{sample}_R2.fastq.gz"
  log: "logs/saturation/subsample/{sample}_{perc}_{seed}.log"
  params:
    sample_perc="{perc}",
    seed="{seed}"
  script:
    "../scripts/sequences/sample_sequences.R"