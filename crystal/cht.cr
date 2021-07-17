#!/usr/bin/crystal

# This should be compiled with the Crystal compiler.
# The shebang is here just to be sure. Please don't directly execute this file.

if ARGV.size == 0
    output = `curl cheat.sh`
    print "\n\n\n\n"
    puts output
    exit 0
end

nocolor = ARGV[0] == "--no-color" || ARGV[0] == "-nc"

if ARGV.size == 1 && nocolor
    output = `curl cheat.sh/`
        .gsub(/\x1b\[[0-9;]*m/, "")

elsif nocolor
    ARGV.delete_at(0)
    args = ARGV.join "/"
    output = `curl cheat.sh/#{args}`
        .gsub(/\x1b\[[0-9;]*m/, "")

else
    args = ARGV.join "/"
    output = `curl cheat.sh/#{args}`

end

print "\n\n\n\n"
puts output
