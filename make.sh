#!/usr/bin/env bash

./xsb_query.sh $1 > output_descendents_xsb.P
./sqlite_query.sh $1