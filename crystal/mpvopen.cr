#!/usr/bin/crystal

# This should be compiled with the Crystal compiler.
# The shebang is here just to be sure. Please don't directly execute this file.

clipboard = `xclip -o`

system "mpv", {"https://nsfwyoutube.com/watchmore?v=" + clipboard.gsub(/.*\?v=/, "")} \
unless system "mpv", {clipboard}
