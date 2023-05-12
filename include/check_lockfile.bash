#!/bin/bash

# DESC: Check if $LOCKFILE exists to prevent running multiple instances
# ARGS: None
# shellcheck disable=2154
check_lockfile() {
    if [ -e "${LOCKFILE}" ]; then
        die 1 "\`${LOCKFILE}' exists"
    fi
}
