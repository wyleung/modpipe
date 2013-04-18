# This will the configuration for this pipeline

# General settings
PEA_MARK := _1
PEB_MARK := _2
FASTQ_EXTENSION := fastq

THREADS := 8


# Load configuration per pipeline
-include project.conf.mk
