PROGNAME := main.bash

test:
	@bats --verbose-run -r test/

watch_exec:
	@fd --type f \.bash$$ | entr -c bash $(PROGNAME)

watch_test:
	@fd --type f "\.bats$$|\.bash$$" | entr -c bats -r test/

.PHONY: \
	test \
	watch_exec \
	watch_test
