#!/bin/bash

# DESC: wraps getopt to parse cli args
# ARGS: $@: arguments from the command line
# NOTE: sets globa vars. such as $action, $pargs, etc.
# shellcheck disable=SC2154,SC2034
parse_args() {
    local name="${f_red}***${a_norm} ${scriptname}"
    temp=$(getopt -o "hvdm:" -l "help,verbose,debug,mode:,version" -n "${name}" -- "$@")

    # `$temp` MUST not be a local variable! otherwise this will NOT work
    # shellcheck disable=SC2181
    if [ $? -ne 0 ]; then
        exit 2
    fi

    # ensures `--` is set in $@. `$temp` **must** be quoted.
    eval set -- "$temp"
    unset temp

    while true; do
        case "$1" in
        "-h" | "--help")
            readonly action="help"
            shift
            continue
            ;;
        "--version")
            readonly action="version"
            shift
            continue
            ;;
        "-v" | "--verbose")
            readonly verbose=true
            shift
            continue
            ;;
        "-d" | "--debug")
            readonly debug=true
            shift
            continue
            ;;
        "-m" | "--mode")
            readonly mode="${2}"
            shift 2
            continue
            ;;
        "--")
            shift
            break
            ;;
        *)
            # this should never happens, because the `eval set -- "$temp"`
            # line sets the explicit `--` arguments. which always get catched
            # before this this case statement.
            die "Ooops, this should not happen. Please report this bug."
            ;;
        esac
    done

    readonly pargs="$*"
}
