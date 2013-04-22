# This will the configuration for this pipeline

# General settings
PEA_MARK := _1
PEB_MARK := _2
FASTQ_EXTENSION := fastq

QSCORE_FORMAT := sanger
THREADS := 8

ALIGNER = stampy


# Samtools.
SAMTOOLS_DIR = /usr/local/samtools/samtools-0.1.18
SAMTOOLS = $(SAMTOOLS_DIR)/samtools




# SGE configuration.
SGE_PE = BWA

# Keep all files (Todo: In view of disk space, maybe we shouldn't do this?).
#.SECONDARY:

# Delete target if recipe returns error status code.
.DELETE_ON_ERROR:

# Makefile specific settings
MAKEFILE_DIR := $(realpath $(dir $(realpath $(lastword $(MAKEFILE_LIST)))))


# Load configuration per pipeline
-include project.conf.mk
