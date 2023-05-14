#!/bin/bash

# DESC: exit if path prefix do NOT exist
# ARGS: $1: path to check
check_path_prefix() {
    local path="$1"
    local prefix="$(realpath "$(dirname "${path}")")"

    if [ ! -d "${prefix}" ]; then
        die 1 "\`${path}' path prefix do not exists"
    fi
}
