#!/bin/bash
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/fixtures/init.bash"

@test "test var colors.bash::f_black" {
    # insert escape code with ^V-ESC
    [ "${f_black}" = "[30m" ]
}

@test "test var colors.bash::f_red" {
    # insert escape code with ^V-ESC
    [ "${f_red}" = "[31m" ]
}

@test "test var colors.bash::f_green" {
    # insert escape code with ^V-ESC
    [ "${f_green}" = "[32m" ]
}

@test "test var colors.bash::f_yellow" {
    # insert escape code with ^V-ESC
    [ "${f_yellow}" = "[33m" ]
}

@test "test var colors.bash::f_blue" {
    # insert escape code with ^V-ESC
    [ "${f_blue}" = "[34m" ]
}

@test "test var colors.bash::f_magenta" {
    # insert escape code with ^V-ESC
    [ "${f_magenta}" = "[35m" ]
}

@test "test var colors.bash::f_cyan" {
    # insert escape code with ^V-ESC
    [ "${f_cyan}" = "[36m" ]
}

@test "test var colors.bash::f_white" {
    # insert escape code with ^V-ESC
    [ "${f_white}" = "[37m" ]
}

@test "test var colors.bash::b_black" {
    # insert escape code with ^V-ESC
    [ "${b_black}" = "[40m" ]
}

@test "test var colors.bash::b_red" {
    # insert escape code with ^V-ESC
    [ "${b_red}" = "[41m" ]
}

@test "test var colors.bash::b_green" {
    # insert escape code with ^V-ESC
    [ "${b_green}" = "[42m" ]
}

@test "test var colors.bash::b_yellow" {
    # insert escape code with ^V-ESC
    [ "${b_yellow}" = "[43m" ]
}

@test "test var colors.bash::b_blue" {
    # insert escape code with ^V-ESC
    [ "${b_blue}" = "[44m" ]
}

@test "test var colors.bash::b_magenta" {
    # insert escape code with ^V-ESC
    [ "${b_magenta}" = "[45m" ]
}

@test "test var colors.bash::b_cyan" {
    # insert escape code with ^V-ESC
    [ "${b_cyan}" = "[46m" ]
}

@test "test var colors.bash::b_white" {
    # insert escape code with ^V-ESC
    [ "${b_white}" = "[47m" ]
}
