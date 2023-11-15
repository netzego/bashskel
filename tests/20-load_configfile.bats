#!/usr/bin/env bats
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/setup_file.bash"
load "${BATS_TEST_DIRNAME}/setup.bash"

@test "include/load_configfile(): \$configfile exists" {
    run -0 load_configfile
}

@test "include/load_configfile(): \$configfile do NOT exists [run as root]" {
    [[ "$UID" -ne 0 ]] && skip

    unbind_readonly "CONFIGFILE"

    run -1 load_configfile

    [ "${output}" = "${ERR_PREFIX} \`${CONFIGFILE}' not found" ]
}
