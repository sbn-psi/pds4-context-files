#! /usr/bin/env bash

wget -r -N --no-host-directories --no-parent https://pds.nasa.gov/data/pds4/context-pds4/ -A '*.xml'
wget -r -N --no-host-directories --no-parent https://pds.nasa.gov/data/pds4/context-pds3/ -A '*.xml'

find data/pds4/context-pds4 -name "*.xml" -exec grep "<logical_identifier>" '{}' \; | sed -e 's/<logical_identifier>//' -e 's~</logical_identifier>~~' -e 's~ *~~' | sort | uniq >  pds4lids.txt

