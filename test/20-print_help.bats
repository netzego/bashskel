#!/bin/bash
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/fixtures/init.bash"

@test "func print_help" {

    run -42 print_help
    [ "${lines[0]}" = "${SCRIPTNAME} (v${VERSION_NUMBER})" ]
}
