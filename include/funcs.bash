#!/bin/bash
# shellcheck disable=SC2154

readonly INFO_COLOR="${f_cyan}"
readonly INFO_STRING=">>>"
readonly INFO_PREFIX="${INFO_COLOR}${INFO_STRING}${a_norm}"
readonly ERR_COLOR="${f_red}"
readonly ERR_STRING="***"
readonly ERR_PREFIX="${ERR_COLOR}${ERR_STRING}${a_norm}"
readonly WARN_COLOR="${f_magenta}"
readonly WARN_STRING="@@@"
readonly WARN_PREFIX="${WARN_COLOR}${WARN_STRING}${a_norm}"

# DESC: prints colored $INFO_PREFIX and "$@" to stdout.
# ARGS: $@: messages to print
# shellcheck disable=2154
info() {
    echo -e "${INFO_PREFIX}" "$*"
}

# DESC: prints colored $ERR_PREFIX and "$@" to stderr.
# ARGS: $@: messages to print
# shellcheck disable=2154
err() {
    echo -e "${ERR_PREFIX}" "$*" >&2
}

# DESC: prints $WARN_PREFIX and "$@" to stderr.
# ARGS: $@: messages to print
# shellcheck disable=2154
warn() {
    echo -e "${WARN_PREFIX}" "$*" >&2
}

# DESC: prints ${@:1} to stderr and exit with code $1
# ARGS: $1: numeric exit code
#       ${@:1}: messages to print
# shellcheck disable=2154
die() {
    local exitcode="$1"
    shift
    err "$*"
    exit "${exitcode}"
}

# DESC: check if path prefix exist.
# ARGS: $1: path to check
# ECHO: boolean
path_prefix_exist() {
    local path="$1"
    local prefix="$(realpath "$(dirname "${path}")")"

    if [ -d "${prefix}" ]; then
        echo true
    else
        echo false
    fi
}
