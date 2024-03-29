#!/usr/bin/env bats
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/setup_file.bash"
load "${BATS_TEST_DIRNAME}/setup.bash"

@test "overwriten variables \$0, \$BASH_ARGV0, \$SCRIPTDIR" {
    [[ "${BASH_ARGV0}" = "bashskel.bash" ]]
    [[ "${BASH_ARGV0}" = "$0" ]]
    [[ "${SCRIPTNAME}" = "bashskel" ]]
    [[ "${SCRIPTDIR}" == *"bashskel" ]]
}

# NOTE: this should be enough to see if sourcing from include/ works
@test "verify some sourced vars/funcs" {
    # include/colors.bash
    [[ -n "${a_norm}" ]]

    # include/utils.bash
    [[ "$(type -t die)" = "function" ]]
}
