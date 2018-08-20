######
#
# A simple Makefile
#
######

PATSCC=${PATSHOME}/bin/patscc
PATSOPT=${PATSHOME}/bin/patsopt

######

all:: test01
all:: test02

######

test01: \
test01.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<

######

test02: \
test02.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<

######

clean:: ; rm -f *~
clean:: ; rm -f test??_dats.c
clean:: ; rm -f test??_dats.o

######

cleanall:: clean
cleanall:: ; rm -f test??
cleanall:: ; rm -f test??_dats

###### end of [Makefile] ######
