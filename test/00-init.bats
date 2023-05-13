#!/bin/bash

load "${BATS_TEST_DIRNAME}/fixtures/init.bash"

# shellcheck disable=SC2154
@test "load fixtures/init.bash and test variables" {
    [ "bashskel.bash" = "${BASH_ARGV0}" ]
    [ "bashskel" = "${SCRIPTNAME}" ]
}
