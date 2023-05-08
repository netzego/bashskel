#!/usr/bin/bash

load "${BATS_TEST_DIRNAME}/fixtures/init.bash"

# shellcheck disable=2154
@test "dump basic script vars" {
	echo "PWD: ${pwd}"
	echo "SCRIPTDIR: ${scriptdir}"
	echo "SCRIPTNAME: ${scriptname}"
	echo "\$0: ${0}"
}
