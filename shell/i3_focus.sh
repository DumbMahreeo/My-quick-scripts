#!/bin/sh

# This script fetches open windows in i3wm and lets you select which one to focus on trough dmenu

blacklist="
telegram-desktop
spotify
"
# a blacklist can be useful as there are some exceptions for some programs
# if the entry doesn't work try escaping it (Ex: telegram\-desktop instead of telegram-desktop)

getName() {
xprop -root _NET_CLIENT_LIST |               # get list of window ids
    grep -o "#.*" |                          # begin filtering of the output
    sed 's/, /\n/g; s/# //g' |               # end filtering of the output
    xargs -I{} -n1 xprop -id {} WM_CLASS |   # use the ids to get the WM_CLASS names
    grep -o '\".*' |                         # begin filtering of the output
    sed 's/\"//g; s/, /\n/g' |       
    sort -u                                  # end filtering of the output 
}

list=$(getName)

for item in $blacklist; do
    list=$(printf "$list" | sed "s/$item//g; /^$/d")   # remove blacklisted items and remaining empty string
done

result=$(echo "$list" | dmenu -i) && i3-msg "[class=$result] focus" # the result to dmenu and communicate with i3
