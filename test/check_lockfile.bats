#!/bin/bash

# shellcheck disable=2155
@test "check_lockfile" {
	source "include/func.bash"

	[[ "$UID" -eq 0 ]] && skip

	run check_lockfile

	[ "${status}" -eq 1 ]
	[ "${output}" = "\`'" ]
}

@test "uid == 0" {
	source "include/func.bash"

	[[ "$UID" -ne 0 ]] && skip

	run check_root

	[ "${status}" -eq 0 ]
	[ "${output}" = "" ]
}
