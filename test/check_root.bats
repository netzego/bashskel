#!/bin/bash
# shellcheck disable=2155

# setup() {
# 	load 'test_helper/bats-support/load'
# 	load 'test_helper/bats-assert/load'
# }

# @test "check_root()" {
# 	# echo "$PWD"
# 	# readonly result="$(run bash main.bash)"
# 	run bash main.bash
# 	[ "${UID}" -ne 0 ]
# 	[ "${status}" -eq 1 ]
# 	[ "${output}" = "must run as root" ]
# }

@test "uid != 0" {
	source "include/func.bash"

	[[ "$UID" -eq 0 ]] && skip

	run check_root

	[ "${status}" -eq 1 ]
	[ "${output}" = "must run as root" ]
}

@test "uid == 0" {
	source "include/func.bash"

	[[ "$UID" -ne 0 ]] && skip

	run check_root

	[ "${status}" -eq 0 ]
	[ "${output}" = "" ]
}
