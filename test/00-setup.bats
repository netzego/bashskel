#!/bin/bash

load "${BATS_TEST_DIRNAME}/fixtures.bats"

# shellcheck disable=SC2154
@test "overwriten variables \$0 and \$BASH_ARGV0" {
    [ "${BASH_ARGV0}" = "bashskel.bash" ]
    [ "${BASH_ARGV0}" = "$0" ]
    [ "${SCRIPTNAME}" = "bashskel" ]
}
