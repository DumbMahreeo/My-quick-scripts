#!/usr/bin/crystal

# This should be compiled with the Crystal compiler.
# The shebang is here just to be sure. Please don't directly execute this file.

args = ARGV.join "+"
system "lynx", {"https://duckduckgo.com/?q=#{args}"}
