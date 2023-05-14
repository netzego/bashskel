#!/usr/bin/bash

load "${BATS_TEST_DIRNAME}/fixtures.bats"

# NOTE: overwrite $0 and $BASH_ARGV0. this might not smart or it's a bug in bats?
# shellcheck disable=2154
@test "dump \$SCRIPTDIR and \$SCRIPTNAME" {
    echo "SCRIPTDIR: ${SCRIPTDIR}"
    echo "SCRIPTNAME: ${SCRIPTNAME}"
    echo "\$0: ${0}"
}
