#!/usr/bin/bash

load "${BATS_TEST_DIRNAME}/fixtures/init.bash"

# shellcheck disable=2154
@test "dump basic script vars" {
	echo "pwd: ${pwd}"
	echo "scriptdir: ${scriptdir}"
	echo "scriptname: ${scriptname}"
	echo "\$0: ${0}"
}
