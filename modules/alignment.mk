include modules/alignment.conf.mk
# override defaults using conf.mk (which includes project.conf.mk)
include ./conf.mk

%.bam: $(IN)
	$(MAKE) -f modules/$(ALIGNER).mk IN="$^" $@
