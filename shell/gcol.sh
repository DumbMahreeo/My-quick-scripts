#!/bin/sh

# get color

xcolor -f $(printf "hex\nrgb" | dmenu) | dmenu | xclip -sel clip
