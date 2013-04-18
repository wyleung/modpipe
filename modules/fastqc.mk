include modules/fastqc.conf.mk
include conf.mk


%.fastqc: %.fastq
	mkdir -p $@;
	fastqc -format fastq -o $@ $^
