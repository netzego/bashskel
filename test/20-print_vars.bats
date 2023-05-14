#!/bin/bash

load "${BATS_TEST_DIRNAME}/fixtures.bats"

@test "print_vars()" {
    run -0 print_vars

    [ "${lines[0]:0:2}" = "--" ]
}
