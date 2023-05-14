#!/bin/bash

# DESC: check if path prefix exist.
# ARGS: $1: path to check
# ECHO: boolean
check_path_prefix() {
    local path="$1"
    local prefix="$(realpath "$(dirname "${path}")")"

    if [ -d "${prefix}" ]; then
        echo true
    else
        echo false
    fi
}

# DESC: exit if $LOGFILE path prefix NOT exists or is NOT writeable
# NOTE: this must run only after load_configfile and parse_args was called
check_logfile() {
    if [ $(check_path_prefix "${LOGFILE}") = true ]; then
        die 1 ""
    fi

    if [ ! -w "${LOGFILE}" ]; then
        die 1 "\`$LOGFILE' is not writeable"
    fi
}

# DESC:
check_args() {
    check_logfile
}
