#!/bin/bash

load "${BATS_TEST_DIRNAME}/fixtures/init.bash"

@test "check_lockfile(): \$LOCKFILE do NOT exists" {

    run -0 check_lockfile
}

# shellcheck disable=SC2154
@test "check_lockfile(): \$LOCKFILE exists" {

    touch "${LOCKFILE}"

    run -1 check_lockfile

    [ "${output}" = "${ERR_PREFIX} \`${LOCKFILE}' exists" ]

    rm "${LOCKFILE}"
}

@test "create_lockfile(): \$LOCKFILE from vars.bash" {

    run -0 create_lockfile

    [ -e "$LOCKFILE" ]

    rm "${LOCKFILE}"
}

@test "create_lockfile(): non existing path" {

    [[ "$UID" -ne 0 ]] && skip

    unbind_readonly "LOCKFILE"

    # shellcheck disable=SC2030
    LOCKFILE="/non_exists/${SCRIPTNAME}.lock"

    run -1 create_lockfile
}

# shellcheck disable=SC2031
@test "delete_lockfile(): \$LOCKFILE exist" {

    touch "${LOCKFILE}"

    run -0 delete_lockfile

    [ ! -e "$LOCKFILE" ]
}

# shellcheck disable=SC2031
@test "delete_lockfile(): \$LOCKFILE NOT exist" {

    run -0 delete_lockfile

    [ ! -e "$LOCKFILE" ]
}
