#!/usr/bin/bash

load "${BATS_TEST_DIRNAME}/fixtures/init.bash"

# shellcheck disable=2154
@test "dump basic script vars" {
    echo "PWD: ${PWD}"
    echo "SCRIPTDIR: ${SCRIPTDIR}"
    echo "SCRIPTNAME: ${SCRIPTNAME}"
    echo "\$0: ${0}"
}
