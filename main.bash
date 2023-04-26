#!/bin/bash
# shellcheck disable=2155

set -eo pipefail

readonly scriptname="$(basename "${BASH_ARGV0%.*}")"
readonly scriptdir="$(dirname "$(realpath "${BASH_ARGV0}")")"
readonly pwd="$(pwd)"
readonly lockfile="/tmp/${scriptname.lockfile}"
readonly configfile="${pwd}/${scriptname}.config"

source "${scriptdir}/include/func.bash"

main() {
	check_root
    check_lockfile
}

main

exit 0
