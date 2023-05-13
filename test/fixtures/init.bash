#!/usr/bin/bash

# DESC: this functions runs once for every bat file
# ARGS: None
setup_file() {
    bats_require_minimum_version 1.5.0
}

# DESC: this functions runs once for every bat function call
# ARGS: None
setup() {
    readonly BASH_ARGV0="bashskel.bash"
    readonly SCRIPTDIR="$(realpath "${BATS_TEST_DIRNAME}/..")"

    source "${SCRIPTDIR}/include/colors.bash"
    source "${SCRIPTDIR}/include/funcs.bash"
    source "${SCRIPTDIR}/include/vars.bash"
    source "${SCRIPTDIR}/include/parse_args.bash"
    source "${SCRIPTDIR}/include/print_vars.bash"
    source "${SCRIPTDIR}/include/check_root.bash"
    source "${SCRIPTDIR}/include/lockfile.bash"
    source "${SCRIPTDIR}/include/load_configfile.bash"
    source "${SCRIPTDIR}/include/print_usage.bash"
    source "${SCRIPTDIR}/include/print_help.bash"
    source "${SCRIPTDIR}/include/print_version.bash"
    source "${SCRIPTDIR}/include/check_logfile.bash"
}

# DESC: unset a readonly variable via gdb
# ARGS: $1: the variable name to unset
# NOTE: this must run as root
unbind_readonly() {
    if [ "$UID" -ne 0 ]; then
        die 1 "\`${FUNCNAME[0]}' must run as root"
    fi

    gdb -ex 'call (int) unbind_variable("'"$1"'")' --pid=$$ --batch
}
