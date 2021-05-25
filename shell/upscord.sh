#!/bin/sh

# How I use the script
# 
# 1) Create a dir in $HOME called .upscord
# 
# 2) Put this script in that directory
# 
# 3) Run the script
# 
# 4) After running the script create a softlink from
#    $HOME/.upscord/Discord/Discord to /usr/bin/discord
#
# That's it. Next time you need to update Discord simply run this script in the .upscord directory.

echo "Downloading"
wget "https://discord.com/api/download?platform=linux&format=tar.gz" -O "discord.tar.gz"

echo "Removing"
rm -rf "Discord"

echo "Extracting"
tar xf "discord.tar.gz"

echo "Cleaning"
rm "discord.tar.gz"


