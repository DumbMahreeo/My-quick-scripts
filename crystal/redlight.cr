#!/usr/bin/crystal

# This should be compiled with the Crystal compiler.
# The shebang is here just to be sure. Please don't directly execute this file.

if ARGV.size != 0
    
    case ARGV[0]

    when "on" then `redshift -PO 5000`
    when "off" then `redshift -x`

    else
        arg = ARGV[0].to_i?
        `redshift -PO #{arg}` if arg != nil

    end

end
