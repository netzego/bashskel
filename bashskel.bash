#!/bin/bash

set -eo pipefail

readonly SCRIPTDIR="$(dirname "$(realpath "${BASH_ARGV0}")")"

source "${SCRIPTDIR}/include/colors.bash"
source "${SCRIPTDIR}/include/vars.bash"
source "${SCRIPTDIR}/include/funcs.bash"
source "${SCRIPTDIR}/include/print_usage.bash"
source "${SCRIPTDIR}/include/print_help.bash"
source "${SCRIPTDIR}/include/parse_args.bash"
source "${SCRIPTDIR}/include/print_vars.bash"

init() {
    parse_args "$@"

    case "${ACTION}" in
    "HELP")
        print_help
        ;;
    "VERSION")
        echo "${SCRIPTNAME} v${VERSION}"
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

    [[ "${VERBOSE}" = true ]] && print_vars

    if [ "$MODE" = "image" ]; then
        log "\$MODE: ${MODE}"
    elif [ "${MODE}" = "disc" ]; then
        log "\$MODE: ${MODE}"
    fi
}

init "$@"

exit 0
