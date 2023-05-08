#!/bin/bash
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/fixtures/init.bash"

@test "func print_help" {

    run -0 print_help
    [ "${lines[0]}" = "${SCRIPTNAME} (v${VERSION_NUMBER})" ]
}
