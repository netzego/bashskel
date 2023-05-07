#!/bin/bash

# DESC: prints usage and exit
# ARGV: None
# shellcheck disable=SC2154
print_usage() {
    echo "usage: ${scriptname} [OPTIONS] <POSITIONAL ARGUMENTS>"

    exit 42
}
