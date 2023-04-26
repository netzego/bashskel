#!/bin/bash
# shellcheck disable=2155

set -eo pipefail

readonly scriptdir="$(dirname "$(realpath "${BASH_ARGV0}")")"

source "${scriptdir}/include/vars.in"
source "${scriptdir}/include/func.in"

main() {
	check_root
	check_lockfile
}

main

exit 0
