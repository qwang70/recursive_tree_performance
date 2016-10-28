#!/usr/bin/env bash

[ $# -eq 0 ] && { echo "Usage: $0 tree_level_number"; exit 1; }

LEVEL_DIR=level_info
LEVEL=$LEVEL_DIR/level$1

xsb -p --quietload --noprompt --nofeedback --nobanner << END_XSB_STDIN

['$LEVEL'].
['downstream'].
['xsb_profiling'].

set_prolog_flag(unknown, fail).
write('%$LEVEL statistics\n'), eol.
write('%...................................................................................................\n'), eol.

profile_call(tree_downstream(_, 1)).

write('%...................................................................................................\n'), eol.


END_XSB_STDIN
