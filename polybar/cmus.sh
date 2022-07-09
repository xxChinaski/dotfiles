#!/bin/bash

prepend_zero () {
    seq -f "%02g" $1 $1
}

artist=$(echo -n $(cmus-remote -C status | grep artist -m 1| cut -c 12-40))
song=$(echo -n $(cmus-remote -C status | grep title | cut -c 11-))
file=$(echo -n $(cmus-remote -C status | grep file -m 1| cut -c 45- | rev | cut -c 5- | rev))

if [[ ${#artist} -gt 1 ]] 
  then 
    echo -n "$artist - $song"
  else 
    echo -n "$file"
fi
