#!/usr/bin/crystal

# This should be compiled with the Crystal compiler.
# The shebang is here just to be sure. Please don't directly execute this file.

# A port of i3-focus.sh in Crystal

WIN_IDS =
    `xprop -root _NET_CLIENT_LIST`
    .gsub(/.*#/, "")
    .strip
    .split ", "

wm_class_list = ""

WIN_IDS.each do |id|
    wm_class =
        `xprop -id #{id} WM_CLASS`
        .split(", ")
        .last[1..-3]

    wm_class_list += wm_class + '\n' if !wm_class_list.includes? wm_class
end

window = `printf "#{wm_class_list}" | dmenu -i`

`i3-msg "[class=#{window}] focus"` if window != ""
