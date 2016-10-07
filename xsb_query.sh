#!/usr/bin/env bash

[ $# -eq 0 ] && { echo "Usage: $0 tree_level_number"; exit 1; }

LEVEL_DIR=level_info
LEVEL=$LEVEL_DIR/level$1

xsb --quietload --noprompt --nofeedback --nobanner << END_XSB_STDIN

['$LEVEL'].
['downstream'].
['general_rules'].

set_prolog_flag(unknown, fail).

rule_banner('print all descendents of the root\n printall(tree_downstream(_, 1)).').
printall(tree_downstream(_, 1)).

rule_banner('count descendents of the root\n printall(count(tree_downstream(_, 1),_)).').
printall(count(tree_downstream(_, 1),_)).

write('%...................................................................................................'), eol.

END_XSB_STDIN
