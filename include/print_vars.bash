#!/bin/bash

# DESC: prints all variables to stdout
# ARGS: None
# shellcheck disable=SC2154
print_vars() {
    printf "%s %16s: %s\n" "--" "ARGS" "${ARGS[*]}"
    printf "%s %16s: %s\n" "--" "ARGS_LENGHT" "${#ARGS[@]}"
    printf "%s %16s: %s\n" "--" "SCRIPTNAME" "${SCRIPTNAME}"
    printf "%s %16s: %s\n" "--" "PWD" "${PWD}"
    printf "%s %16s: %s\n" "--" "VERSION_NUMBER " "${VERSION_NUMBER}"
    printf "%s %16s: %s\n" "--" "LOCKFILE" "${LOCKFILE}"
    printf "%s %16s: %s\n" "--" "CONFIGFILE" "${CONFIGFILE}"
    printf "%s %16s: %s\n" "--" "VERBOSE" "${VERBOSE}"
    printf "%s %16s: %s\n" "--" "DEBUG" "${DEBUG}"
    printf "%s %16s: %s\n" "--" "POS_ARGS" "${POS_ARGS[*]}"
    printf "%s %16s: %s\n" "--" "POS_ARGS_LENGTH" "${#POS_ARGS[@]}"
    printf "%s %16s: %s\n" "--" "FOO" "${FOO}"
    printf "%s %16s: %s\n" "--" "BAR" "${BAR}"
}
