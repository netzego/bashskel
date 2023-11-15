#!/usr/bin/env bats
# shellcheck disable=SC2154

load "${BATS_TEST_DIRNAME}/fixtures.bash"

@test "print bats special variables" {
    # https://bats-core.readthedocs.io/en/stable/writing-tests.html#special-variables
    tapecho "BATS_RUN_COMMAND: ${BATS_RUN_COMMAND}"
    tapecho "BATS_TEST_FILENAME: ${BATS_TEST_FILENAME}"
    tapecho "BATS_TEST_DIRNAME: ${BATS_TEST_DIRNAME}"
    tapecho "BATS_TEST_NAMES: ${BATS_TEST_NAMES}"
    tapecho "BATS_TEST_NAME: ${BATS_TEST_NAME}"
    tapecho "BATS_TEST_NAME_PREFIX: ${BATS_TEST_NAME_PREFIX}"
    tapecho "BATS_TEST_DESCRIPTION: ${BATS_TEST_DESCRIPTION}"
    tapecho "BATS_TEST_RETRIES: ${BATS_TEST_RETRIES}"
    tapecho "BATS_TMPDIR: ${BATS_TMPDIR}"
    tapecho "BATS_RUN_TMPDIR: ${BATS_RUN_TMPDIR}"
    tapecho "BATS_FILE_EXTENSION: ${BATS_FILE_EXTENSION}"
    tapecho "BATS_SUITE_TMPDIR: ${BATS_SUITE_TMPDIR}"
    tapecho "BATS_FILE_TMPDIR: ${BATS_FILE_TMPDIR}"
    tapecho "BATS_VERSION: ${BATS_VERSION}"
}
