#!/bin/bash

#
# simple script to prettify xhmtl output of FLEx dictionary
#
# Usage: prettyxhtml.sh -FLAG file.xhtml where FLAG is either
# 
# o for simple output on standard output
#
# s for saving the output to pretty_file.xhtml
#
# h for printing a help text
#
# The script uses xmllint (available via package libxml2-utils).
#

print_help() {
printf "Usage: prettyxhtml.sh -FLAG file.xhtml where FLAG is either:
	o for simple output on standard output
	s for saving the output to pretty_file.xhtml
	h for printing this help text
"
}

while getopts 'osh' flag; do

	case "${flag}" in

		o) xmllint -format "$2" ;;
		s) xmllint -format "$2" > "pretty_${2}" ;;
		h) print_help ;;
		*) print_help
		   exit 1 ;;

	esac
done

