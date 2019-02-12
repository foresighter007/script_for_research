#!/bin/bash 

function submit()
{
    cd $1

    for i in `ls`
    do 
        if [ -d "$i" ]; then
            submit "$i"
        elif [ "${i#*.}" == "pbs" ]; then
            echo -e "$i is a pbs file\n"
            qsub $i 
        else 
            echo -e "$i is not a pbs file\n"
        fi
    done
    
    cd ..
}

submit $1

exit 0
