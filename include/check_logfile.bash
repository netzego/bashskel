#!/bin/bash

# DESC: Check if $LOGFILE points to valid path
# ARGS: None
# shellcheck disable=2154,SC2155
check_logfile() {
    local logfile_dir="$(realpath "$(dirname "${LOGFILE}")")"
    if [ ! -d "${logfile_dir}" ]; then
        echo "\`${LOGFILE}' path to file do not exist" >&2
        exit 1
    fi
}
