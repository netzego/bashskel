#!/bin/bash

load "${BATS_TEST_DIRNAME}/fixtures/init.bash"

@test "write_lockfile(): \$LOCKFILE do NOT exists" {
    run -0 write_lockfile "${LOCKFILE}"

    [ -e "$LOCKFILE" ]

    rm "${LOCKFILE}"
}

@test "write_lockfile(): \$LOCKFILE do exists" {
    touch "${LOCKFILE}"

    run -1 write_lockfile

    [ "${output}" = "${ERR_PREFIX} \`${LOCKFILE}' exists" ]

    rm "${LOCKFILE}"
}

@test "write_lockfile(): \$LOCKFILE path prefix NOT exists" {
    [[ "$UID" -ne 0 ]] && skip

    unbind_readonly "LOCKFILE"

    # shellcheck disable=SC2030
    LOCKFILE="/non_exists/${SCRIPTNAME}.lock"

    [ "${output}" = "${ERR_PREFIX} \`${LOCKFILE}' path prefix do not exists" ]

    run -1 write_lockfile
}
