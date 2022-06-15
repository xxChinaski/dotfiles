#!/bin/bash

prepend_zero () {
    seq -f "%02g" $1 $1
}

artist=$(echo -n $(cmus-remote -C status | grep artist -m 1| cut -c 12-40))
song=$(echo -n $(cmus-remote -C status | grep title | cut -c 11-))
file=$(echo -n $(cmus-remote -C status | grep file -m 1| cut -c 45- | rev | cut -c 5- | rev))

position=$(cmus-remote -C status | grep position | cut -c 10-)
minutes1=$(prepend_zero $(($position / 60)))
seconds1=$(prepend_zero $(($position % 60)))

duration=$(cmus-remote -C status | grep duration | cut -c 10-)
minutes2=$(prepend_zero $(($duration / 60)))
seconds2=$(prepend_zero $(($duration % 60)))

if [[ ${#artist} -gt 1 ]] 
  then 
    echo -n "$artist - $song"
  else 
    echo -n "$file"
fi
