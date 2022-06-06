#!/bin/sh -

bspc subscribe node_geometry | while IFS=' ' read -r e m d n g r; do
    if bspc query -T -n "$n.floating" > /tmp/bspwm_geom; then
        printf '%s\n' "$g" > /tmp/bspwm_geom_"$(jq -j '
            .client | .className, ":", .instanceName
        ' /tmp/bspwm_geom)"
    fi
done
