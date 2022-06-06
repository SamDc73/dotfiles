#!/bin/sh -

class=$2 instance=$3

if IFS= read -r rectangle < /tmp/bspwm_geom_"$class":"$instance"
    then printf 'rectangle=%s\n' "$rectangle"
fi
