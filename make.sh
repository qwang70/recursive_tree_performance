#!/usr/bin/env bash
rm -rf runtime_output.txt
if [ "$1" == "all" ] || [ -z $1 ] ; then
    # compute runtime for tree level from 2 to 20
    for i in `seq 2 20`;
    do
        # run query for xsb
        echo "############################# tree level $i #############################" >> runtime_output.txt
        echo "Run xsb recursive query:" >> runtime_output.txt
        ./xsb_query.sh $i >> runtime_output.txt

        # run query for SQLite
        echo "Run sqlite recursive query:" >> runtime_output.txt
        ./sqlite_query.sh $i >> runtime_output.txt
    done
    # extract level info
    cat runtime_output.txt | grep "###" | cut -d' ' -f4 > runtime_levels.txt
    # extract running time of xsb
    cat runtime_output.txt | grep  "Total cputime:" | cut -d' ' -f7 > runtime_xsb.txt
    # extract running time of sqlite3
    cat runtime_output.txt | grep  "Run Time:" | cut -d' ' -f4 > runtime_sql.txt

    # generate formated runtime data
    paste runtime_levels.txt runtime_xsb.txt runtime_sql.txt > runtime_xsb_sql.txt
    echo -e "#level\txsb(s)\tsql(s)" | cat - runtime_xsb_sql.txt > temp && mv -f temp runtime_xsb_sql.txt
    rm -rf runtime_levels.txt runtime_xsb.txt runtime_sql.txt

    #plot runtime data and save it into SVG file("tree_level_vs_time.svg")
    gnuplot plot.gnu
    open tree_level_vs_time.svg
else
    echo "############################# tree level $1 #############################"
    echo "Run xsb recursive query:"
    ./xsb_query.sh $1
    echo "Run sqlite recursive query:"
    ./sqlite_query.sh $1
fi

