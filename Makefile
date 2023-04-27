PROGNAME		!= ss.bash
BATS			:= $(shell which bats)
BATS_OPTIONS	:= --verbose-run --show-output-of-passing-tests

test:
	@$(BATS) $(BATS_OPTIONS) -r test/

watch_run:
	@fd --type f \.bash$$ | entr -c bash $(PROGNAME)

watch_test:
	fd --type f "\.bats$$|\.bash$$" | entr -c $(BATS) $(BATS_OPTIONS) -r test/

.PHONY: \
	test \
	watch_exec \
	watch_test
