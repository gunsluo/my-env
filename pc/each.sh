#!/bin/bash

function eachdir(){
        for file in ` ls $1 `
        do
                if [ -d "$1/$file" ]
                then
                        eachdir "$1/$file" "$2"
                else
                        ls "$1/$file" | xargs $2
                fi
        done
}

if [ ! -n "$1" ] ;then
    echo "please input each dir..."
    exit 0
fi

CMD="$2"
if [ ! -n "$2" ] ;then
   CMD="dos2unix"
fi

echo "each $CMD $1"
eachdir $1 $CMD
