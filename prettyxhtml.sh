#!/bin/bash

#
# simple script to prettify xhmtl output of FLEx dictionary
#
# usage: prettyxhtml.sh file.xhtml
#
# redirect to file if needed (e.g. "... > prettier-file.xml")
#
# explanation of tidy flags: -i = indent, -q = quiet/surpress non-essential output
#

cat "$1" | tidy -xml -iq
