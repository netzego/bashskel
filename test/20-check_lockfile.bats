#!/bin/bash

load "${BATS_TEST_DIRNAME}/fixtures/init.bash"

@test "func.in::check_lockfile(): $lockfile do NOT exists" {

	run -0 check_lockfile
}

# shellcheck disable=SC2154
@test "func.in::check_lockfile(): $lockfile exists" {

	touch "${lockfile}"

	run -1 check_lockfile

	[ "${output}" = "\`${lockfile}' exists" ]

	rm "${lockfile}"
}
