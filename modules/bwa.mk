include modules/bwa.conf.mk
include conf.mk

# The target is .bam, we expect input: .fastq

%.sai: %.$(FASTQ_EXTENSION)
	bwa aln -t $(THREADS) -f $@ $(REFERENCE_BWA) $<

%.sam: %$(PEA_MARK).sai %$(PEB_MARK).sai %$(PEA_MARK).$(FASTQ_EXTENSION) %$(PEB_MARK).$(FASTQ_EXTENSION)
	bwa sampe $(REFERENCE_BWA) -f $@ $^

%.bam: %.sam
	samtools view -bST $(REFERENCE) -o $@ $<
