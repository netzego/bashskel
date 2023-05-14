#!/bin/bash

# DESC: writes $LOCKFILE or exit
# ARGS: none
# EXIT: if $LOCKFILE already exists
#       if $LOCKFILE path prefix does not exists
write_lockfile() {
    # shellcheck disable=SC2046
    if [ $(check_path_prefix "${LOCKFILE}") = false ]; then
        die 1 "\`${LOCKFILE}' path prefix do not exists"
    fi

    if [ -e "${LOCKFILE}" ]; then
        die 1 "\`${LOCKFILE}' exists"
    fi

    touch "${LOCKFILE}"
}
