#!/usr/bin/env bash

[ $# -eq 0 ] && { echo "Usage: $0 tree_level_number"; exit 1; }

LEVEL_DIR=level_info
LEVEL=$LEVEL_DIR/level$1

xsb -p --quietload --noprompt --nofeedback --nobanner << END_XSB_STDIN

['$LEVEL'].
['downstream'].
['general_rules'].
['xsb_profiling'].

set_prolog_flag(unknown, fail).
write('%$LEVEL statistics'), eol.
write('%...................................................................................................'), eol.

profile_call(tree_downstream(_, 1)).

write('%...................................................................................................'), eol.


END_XSB_STDIN
