# Load all module definition
include modules.mk
include conf.mk

all: qc aligment

SAMPLE := $(shell ls *$(PEA_MARK).$(FASTQ_EXTENSION) | python -c 'import os; import sys; print os.path.commonprefix(list(sys.stdin)).split("_")[0]')
PAIRS := $(shell ls *$(PEA_MARK).$(FASTQ_EXTENSION) | sed 's/$(LEFT_SUFFIX).$(FASTQ_EXTENSION)//')
SINGLES := $(basename $(shell ls *$(PEA_MARK).$(FASTQ_EXTENSION) *$(RIGHT_SUFFIX).$(FASTQ_EXTENSION)))

qc: $(addsuffix .fastqc, $(SINGLES))
aligment: $(addsuffix .bam, $(SAMPLE))

%.fastqc: %.$(FASTQ_EXTENSION)
	$(MAKE) -f ./modules/fastqc.mk $@

%.bam: %$(PEA_MARK).$(FASTQ_EXTENSION) %$(PEB_MARK).$(FASTQ_EXTENSION)
	$(MAKE) -f ./modules/alignment.mk IN="$^" $@



