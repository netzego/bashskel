#!/bin/bash

# DESC: prints all variables to stdout
# ARGS: None
# shellcheck disable=SC2154
print_vars() {
    printf "%s %16s: %s\n" "--" "SCRIPTNAME" "${scriptname}"
    printf "%s %16s: %s\n" "--" "PWD" "${pwd}"
    printf "%s %16s: %s\n" "--" "VERSION" "${version}"
    printf "%s %16s: %s\n" "--" "LOCKFILE" "${lockfile}"
    printf "%s %16s: %s\n" "--" "CONFIGFILE" "${configfile}"
    printf "%s %16s: %s\n" "--" "VERBOSE" "${verbose}"
    printf "%s %16s: %s\n" "--" "DEBUG" "${debug}"
    printf "%s %16s: %s\n" "--" "ACTION" "${action}"
}
