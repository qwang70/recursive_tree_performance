#!/usr/bin/env bash
echo "run xsb recursive query"
time ./xsb_query.sh $1 > output_descendents_xsb.P
echo "run sqlite recursive query"
./sqlite_query.sh $1