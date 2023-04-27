#!/bin/bash

readonly a_norm=$(tput sgr 0 0)       # sgr
readonly a_underline=$(tput sgr0 1)  # sgr
readonly a_reverse=$(tput sgr0 2)    # sgr
readonly a_bold=$(tput sgr0 4)       # sgr

readonly f_black=$(tput setaf 0)
readonly f_red=$(tput setaf 1)
readonly f_green=$(tput setaf 2)
readonly f_yellow=$(tput setaf 3)
readonly f_blue=$(tput setaf 4)
readonly f_magenta=$(tput setaf 5)
readonly f_cyan=$(tput setaf 6)
readonly f_white=$(tput setaf 7)

# readonly b_black=$(tput setbg 0)
# readonly b_red=$(tput setbg 1)
# readonly b_green=$(tput setbg 2)
# readonly b_yellow=$(tput setbg 3)
# readonly b_blue=$(tput setbg 4)
# readonly b_magenta=$(tput setbg 5)
# readonly b_cyan=$(tput setbg 6)
# readonly b_white=$(tput setbg 7)

# vi: ft=bash
