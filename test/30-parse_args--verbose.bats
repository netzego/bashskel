#!/bin/bash

load "${BATS_TEST_DIRNAME}/fixtures.bats"

@test "parse_args(): --verbose/-v" {
    local args=(
        "--verbose"
        "--verb"
        "-v"
    )

    for arg in "${args[@]}"; do
        run -0 parse_args "${arg}"
    done
}
