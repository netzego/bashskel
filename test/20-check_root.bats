#!/bin/bash

load "fixtures/init.bash"

@test "func.in::check_root(): \$UID == 0" {

	[[ "$UID" -ne 0 ]] && skip

	run -0 check_root
}

@test "func.in::check_root(): \$UID != 0" {

	[[ "$UID" -eq 0 ]] && skip

	run -1 check_root

	[ "${output}" = "must run as root" ]
}