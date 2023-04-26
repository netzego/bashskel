#!/bin/bash
# shellcheck disable=2155

setup() {
	source "include/vars.in"
	source "include/func.in"
}

@test "check_root(): \$UID != 0" {
	[[ "$UID" -eq 0 ]] && skip

	run check_root

	[ "${status}" -eq 1 ]
	[ "${output}" = "must run as root" ]
}

@test "check_root(): \$UID == 0" {
	[[ "$UID" -ne 0 ]] && skip

	run check_root

	[ "${status}" -eq 0 ]
	[ "${output}" = "" ]
}
