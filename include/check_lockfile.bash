#!/bin/bash

# DESC: Check if $LOCKFILE exists to prevent running multiple instances
# ARGS: None
# shellcheck disable=2154
check_lockfile() {
    if [ -e "${LOCKFILE}" ]; then
        echo "\`${LOCKFILE}' exists" >&2
        exit 1
    fi
}
