DICT   ?= /usr/share/dict/words
NTILES ?= 20

SCRIPTS1 := $(filter-out bruteforce/% z3/%,$(wildcard */lettergen1))
SCRIPTS2 := $(filter-out bruteforce/% z3/%,$(wildcard */lettergen2))
RESULTS1 := $(SCRIPTS1:%/lettergen1=%/results1)
RESULTS2 := $(SCRIPTS2:%/lettergen2=%/results2)
RESULTS  := $(sort $(RESULTS1) $(RESULTS2))

report : $(RESULTS)
	@ echo
	@ echo $^ | xargs -n1 sh -ec 'printf "%s: %s words\n%s\n\n" $$1 `tail -n +2 $$1 | wc -l` `head -1 $$1`' --

%/results1 : %/lettergen1 $(DICT)
	@ echo running "$@" ...
	@ $< $(NTILES) $(DICT) > $@

%/results2 : %/lettergen2 $(DICT)
	@ echo running "$@" ...
	@ $< $(NTILES) $(DICT) > $@

clean :
	rm -f $(RESULTS)
