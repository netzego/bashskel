#!/bin/bash

load "${BATS_TEST_DIRNAME}/fixtures.bats"

# DESC: test bats setup func
# shellcheck disable=SC2154
@test "fixtures.bats::setup(): test variables" {
    [ "${BASH_ARGV0}" = "bashskel.bash" ]
    [ "${SCRIPTNAME}" = "bashskel" ]
}
