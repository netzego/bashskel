#!/bin/bash

setup() {
	source "include/vars.in"
	source "include/func.in"
}

@test "check_lockfile(): not exists" {
	run check_lockfile
	[ "${status}" -eq 0 ]
	[ "${output}" = "" ]
}

@test "check_lockfile(): exists" {
	touch "${lockfile}"
	run check_lockfile
	[ "${status}" -eq 1 ]
	[ "${output}" = "\`${lockfile}' not found" ]
	rm "${lockfile}"
}
