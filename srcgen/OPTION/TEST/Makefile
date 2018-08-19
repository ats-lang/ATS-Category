######
#
# A simple Makefile
#
######

PATSCC=${PATSHOME}/bin/patscc
PATSOPT=${PATSHOME}/bin/patsopt

######

all:: test01

######

test01: \
test01.dats; \
$(PATSCC) -cleanaft -o $@ $<

######

clean:: ; rm *~

######

cleanall:: ; rm -f test??
cleanall:: ; rm -f test??_dats

###### end of [Makefile] ######
