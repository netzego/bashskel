#!/bin/bash
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/fixtures/init.bash"

@test "func print_usage" {

    run -42 print_usage
    [ "${lines[0]:0:5}" = "usage" ]
}
