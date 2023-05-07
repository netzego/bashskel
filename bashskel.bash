#!/bin/bash

set -eo pipefail

readonly scriptdir="$(dirname "$(realpath "${BASH_ARGV0}")")"

source "${scriptdir}/include/colors.bash"
source "${scriptdir}/include/vars.bash"
source "${scriptdir}/include/funcs.bash"
source "${scriptdir}/include/usage.bash"
source "${scriptdir}/include/print_help.bash"
source "${scriptdir}/include/parse_args.bash"
source "${scriptdir}/include/print_vars.bash"

init() {
    parse_args "$@"

    case "${action}" in
    "help")
        print_help
        ;;
    "version")
        echo "${scriptname} v${version}"
        exit 42
        ;;
    *)
        main
        ;;
    esac
}

main() {
    # check_root
    check_lockfile
    load_configfile

    [[ "${verbose}" = true ]] && print_vars

    if [ "$mode" = "image" ]; then
        log "\$mode: ${mode}"
    elif [ "${mode}" = "disc" ]; then
        log "\$mode: ${mode}"
    fi
}

init "$@"

exit 0
