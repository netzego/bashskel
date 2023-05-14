#!/bin/bash

# DESC: check if path prefix exists and is writeable
# ARGS: $1: path to check
# EXIT: if path prefix do not exists
#       if path prefix is not writeable
check_path_prefix() {
    local path="$1"
    local prefix="$(realpath "$(dirname "${path}")")"

    if [ ! -d "${prefix}" ]; then
        die 1 "\`${path}' path prefix do not exists"
    fi

    if [ ! -w "${prefix}" ]; then
        die 1 "\`${path}' path prefix is not writeable"
    fi
}
}
