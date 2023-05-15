#!/bin/bash

load "${BATS_TEST_DIRNAME}/fixtures.bats"

@test "parse_args(): --help/-h" {
    local args=(
        "--help"
        "-h"
    )

    for arg in "${args[@]}"; do
        run -0 parse_args "${arg}"
    done
}
