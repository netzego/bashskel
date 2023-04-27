#!/bin/bash

load "${BATS_TEST_DIRNAME}/fixtures/init.bash"

@test "func.in::load_configfile(): \$configfile exists" {

	run -0 load_configfile
}

@test "func.in::load_configfile(): \$configfile do NOT exists" {

	[[ "$UID" -ne 0 ]] && skip

	unbind_readonly "configfile"

	run -1 load_configfile

	[ "${output}" = "\`' not found" ]
}
