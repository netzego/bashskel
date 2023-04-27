#!/bin/bash

load "${BATS_TEST_DIRNAME}/fixtures/init.bash"

# shellcheck disable=SC2154
@test "test init.bash" {
	[ "bashskel.bash" = "${BASH_ARGV0}" ]
	[ "bashskel" = "${scriptname}" ]
}
