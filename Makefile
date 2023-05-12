PROGNAME		:= bashskel.bash
ARGS			:= --debug --mode image /dev/loop0
BATS			:= $(shell which bats)
BATS_OPTIONS	:= --verbose-run --show-output-of-passing-tests

test:
	@$(BATS) $(BATS_OPTIONS) -r test/

run:
	bash $(PROGNAME)

watch_run:
	@fd --type f \.bash$$ | entr -c bash $(PROGNAME) $(CLI_ARGS)

watch_test:
	@fd --type f "\.bats$$|\.bash$$" | entr -c $(BATS) $(BATS_OPTIONS) -r test/$(BATS_GLOB)

.PHONY: \
	test \
	watch_run \
	watch_test

.DEFAULT_GOAL := run
