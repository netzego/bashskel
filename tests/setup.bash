#!/bin/bash
# shellcheck disable=SC2154

# DESC: this functions runs once for every bat file
# ARGS: none
# NOTE: overwrite $0 and $BASH_ARGV0. might not smart or it's a bug in bats?
setup() {
    # overwrite `BASH_ARGV0`; we depend on it in the `bashskel.bash` script
    declare -rg BASH_ARGV0="bashskel.bash"
    # overwrite `$SCRIPTDIR`; this is set in `bashskel.bash` directly (so it is
    # not sourced)
    declare -rg SCRIPTDIR="$(realpath "${BATS_TEST_DIRNAME}/..")"

    load "fixtures.bash"

    load "../include/colors.bash"
    load "../include/utils.bash"
    load "../include/vars.bash"
    load "../include/cleanup.bash"
    load "../include/check_root.bash"
    load "../include/load_configfile.bash"
    load "../include/parse_args.bash"
    load "../include/check_args.bash"
    load "../include/write_lockfile.bash"
    load "../include/print_help.bash"
    load "../include/print_version.bash"
    load "../include/print_usage.bash"
    load "../include/print_vars.bash"
}
