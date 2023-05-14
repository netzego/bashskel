#!/bin/bash

# DESC: ensure that bats is good to go
@test "bats is working" {
    # shellcheck disable=SC2050
    [ 1 -eq 1 ]
}
