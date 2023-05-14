#!/bin/bash

cleanup() {
    # remove $LOCKFILE
    if [ -e "${LOCKFILE}" ]; then
        rm -v "${LOCKFILE}"
    fi
}
# DESC: clean up artifacts on exit signals
# ARGS: none
# NOTE: this is meant to call from a trap
