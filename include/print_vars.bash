#!/bin/bash

# DESC: prints all variables to stdout
# ARGS: None
# shellcheck disable=SC2154
print_vars() {
    printf "%s %16s: %s\n" "--" "scriptname" "${scriptname}"
    printf "%s %16s: %s\n" "--" "pwd" "${pwd}"
    printf "%s %16s: %s\n" "--" "version" "${version}"
    printf "%s %16s: %s\n" "--" "lockfile" "${lockfile}"
    printf "%s %16s: %s\n" "--" "configfile" "${configfile}"
    printf "%s %16s: %s\n" "--" "verbose" "${verbose}"
    printf "%s %16s: %s\n" "--" "debug" "${debug}"
    printf "%s %16s: %s\n" "--" "action" "${action}"
}
