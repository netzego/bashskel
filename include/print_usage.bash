#!/bin/bash

# DESC: prints usage and exit
# ARGV: None
# shellcheck disable=SC2154
print_usage() {
    echo "usage: ${SCRIPTNAME} [OPTIONS] <POSITIONAL ARGUMENTS>"

    exit 42
}
