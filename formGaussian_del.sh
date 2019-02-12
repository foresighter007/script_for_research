#!/bin/bash 

function formgaussian()
{
    cd $1

    for i in `ls`
    do 
        if [ -d "$i" ]; then
            formgaussian "$i"
        elif [ "${i#*.}" == "chk" ]; then
            echo -e "$i is a chk file\n"
            formchk $i 
			rm $i
        else 
            echo -e "$i is not a chk file\n"
        fi
    done
    
    cd ..
}

formgaussian $1

exit 0
