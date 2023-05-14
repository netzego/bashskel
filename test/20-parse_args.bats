#!/bin/bash

load "${BATS_TEST_DIRNAME}/fixtures.bats"

@test "parse_args(): --help" {
    local args=("--help")

    run -0 parse_args "${args[@]}"
}

@test "parse_args(): -h" {
    local args=("-h")

    run -0 parse_args "${args[@]}"
}

# NOTE: "--vers" also works as long it is unique
@test "parse_args(): --version" {
    local args=("--version")

    run -0 parse_args "${args[@]}"
}

@test "parse_args(): --debug" {
    local args=("--debug")

    run -0 parse_args "${args[@]}"
}

@test "parse_args(): -d" {
    local args=("-d")

    run -0 parse_args "${args[@]}"
}

@test "parse_args(): --verbose" {
    local args=("--verbose")

    run -0 parse_args "${args[@]}"
}

@test "parse_args(): -v" {
    local args=("-v")

    run -0 parse_args "${args[@]}"
}

@test "parse_args(): positional arguments" {
    local args=(
        "pos_a"
        "pos_b"
    )

    run -0 parse_args "${args[@]}"
}

@test "parse_args(): positional arguments with --" {
    local args=(
        "--"
        "pos_a"
        "pos_b"
    )

    run -0 parse_args "${args[@]}"
}

@test "parse_args(): -x" {
    local args=("-x")

    run -2 parse_args "${args[@]}"

    [[ "${output}" == "${ERR_PREFIX} ${SCRIPTNAME}: invalid option"* ]]
}

@test "parse_args(): --wrong" {
    local args=("--wrong")

    run -2 parse_args "${args[@]}"

    [[ "${output}" == "${ERR_PREFIX} ${SCRIPTNAME}: unrecognized option"* ]]
}

@test "parse_args(): --help --wrong" {
    local args=(
        "--help"
        "--wrong"
    )

    run -2 parse_args "${args[@]}"

    [[ "${output}" == "${ERR_PREFIX} ${SCRIPTNAME}: unrecognized option"* ]]
}
