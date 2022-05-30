#!/bin/bash

#
# simple script to prettify xhmtl output of FLEx dictionary
#
# usage: prettyxhtml.sh file.xhtml
#
# redirect to file if needed (e.g. "... > prettier-file.xml")
#
# uses xmllint (available via package libxml2-utils)
#

xmllint -format "$1"
