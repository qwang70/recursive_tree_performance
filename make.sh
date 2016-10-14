#!/usr/bin/env bash
if [ $1 = "all" ]; then
    for i in `seq 2 20`;
    do
        echo "############################# tree level $i #############################"
        echo "Run xsb recursive query:"
        ./xsb_query.sh $i

        echo "Run sqlite recursive query:"
        ./sqlite_query.sh $i
    done
else
    echo "############################# tree level $1 #############################"
    echo "Run xsb recursive query:"
    ./xsb_query.sh $1
    echo "Run sqlite recursive query:"
    ./sqlite_query.sh $1
fi