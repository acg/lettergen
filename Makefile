DICT   ?= /usr/share/dict/words
NTILES ?= 20

SCRIPTS1 := $(wildcard */lettergen1)
SCRIPTS2 := $(wildcard */lettergen2)
RESULTS1 := $(SCRIPTS1:%/lettergen1=%/results1)
RESULTS2 := $(SCRIPTS2:%/lettergen2=%/results2)
RESULTS  := $(sort $(RESULTS1) $(RESULTS2))

report : $(RESULTS)
	@ echo
	@ echo '## Results'
	@ echo
	@ echo $^ | xargs -n1 sh -ec 'printf "%s: %s (%s words)\n" $$1 `head -1 $$1` `tail -n +2 $$1 | wc -l`' --

%/results1 : %/lettergen1 $(DICT)
	$< $(NTILES) $(DICT) > $@

%/results2 : %/lettergen2 $(DICT)
	$< $(NTILES) $(DICT) > $@

clean :
	rm -f $(RESULTS)
