#!/usr/bin/bash

# DESC: this magic functions is runs once for every bat file
# ARGS: None
setup_file() {
	bats_require_minimum_version 1.5.0
}

# DESC: this magic functions is runs once for every bat function
# ARGS: None
setup() {
	readonly BASH_ARGV0="bashskel.bash"
	readonly scriptdir="$(realpath "${BATS_TEST_DIRNAME}/..")"

	source "${scriptdir}/include/colors.bash"
	source "${scriptdir}/include/funcs.bash"
	source "${scriptdir}/include/vars.bash"
	source "${scriptdir}/include/parse_args.bash"
}

# DESC: unset a readonly variable via gdb
# ARGS: $1: the variable name to unset
# NOTE: this must run as root
unbind_readonly() {
	gdb -ex 'call (int) unbind_variable("'"$1"'")' --pid=$$ --batch
}
