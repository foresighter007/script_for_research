#!/bin/bash

function getHF()
{
    cd $1

    for i in `ls`
    do
        if [ -d "$i" ]; then
            getHF "$i"
        elif [ "${i#*.}" == "log" ]; then
            echo -e "$i is a log file\n"
            echo "$i" >> $temp_path
            cat $i | sed -nf $temp_path1 >> $temp_path 
        fi
    done

    cd ..
}

vi `pwd`/calc_result
temp_path="`pwd`/calc_result"
temp_path1="`pwd`/scriptsed_HF"
getHF $1

exit 0

