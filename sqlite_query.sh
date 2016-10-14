#!/usr/bin/env bash

[ $# -eq 0 ] && { echo "Usage: $0 tree_level_number"; exit 1; }

LEVEL=level$1
SUBSTITUTE=s/level20/${LEVEL}/

if [ ! -f tree.db ]; then
    echo "creating tree.db ......"
    sqlite3 tree.db < createtable.sql
    echo "tree edges created"
fi

cat query.sql | sed $SUBSTITUTE > temp.sql
sqlite3 tree.db < temp.sql
echo "All descendents of the tree root found"
rm -rf temp.sql

sqlite3 -header -csv tree.db "select * from data_downstream_reduced;" > output_descendents_sqlite.csv