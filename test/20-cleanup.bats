#!/bin/bash

load "${BATS_TEST_DIRNAME}/fixtures.bats"

@test "cleanup()" {
    run -0 cleanup
}
