#!/bin/bash

load "${BATS_TEST_DIRNAME}/fixtures.bats"

@test "run func parse_args --help" {

    run -0 parse_args "--help"
    run -0 parse_args "-h"
}

@test "run func parse_args --version" {

    run -0 parse_args "--version"

    # note this works if it unique
    run -0 parse_args "--vers"
}

@test "run func parse_args --debug" {

    run -0 parse_args "--debug"
    run -0 parse_args "-d"
}

@test "run func parse_args --verbose" {

    run -0 parse_args "--verbose"
    run -0 parse_args "-v"
}

@test "run func parse_args positional_arg" {

    run -0 parse_args "positional_arg"
}

@test "run func parse_args -- positional_arg" {

    run -0 parse_args "--" "positional_arg"
}

@test "run func parse_args -x" {
    local args=(
        "-x"
    )
    run -2 parse_args "${args[@]}"
}

@test "run func parse_args --wrong" {
    local args=(
        "--wrong"
    )
    run -2 parse_args "${args[@]}"
}

@test "run func parse_args --help --wrong" {
    local args=(
        "--help"
        "--wrong"
    )
    run -2 parse_args "${args[@]}"
}
