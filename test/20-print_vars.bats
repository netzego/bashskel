#!/bin/bash

load "${BATS_TEST_DIRNAME}/fixtures/init.bash"

@test "run func print_vars" {

    run -0 print_vars
    [ "${lines[0]:0:2}" = "--" ]
}
