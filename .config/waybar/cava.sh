#https://github.com/ray-pH/waybar-cava
#! /bin/bash
# set -euo pipefail # quickfix (https://github.com/Alexays/Waybar/issues/358)
set -o errexit # quickfix (https://github.com/Alexays/Waybar/issues/121)

bar="⣀⣄⣤⣦⣶⣷⣿"
dict="s/;//g;"

# creating "dictionary" to replace char with bar
i=0
while [ $i -lt ${#bar} ]
do
    dict="${dict}s/$i/${bar:$i:1}/g;"
    i=$((i=i+1))
done

# write cava config
config_file="/tmp/polybar_cava_config"
echo "
[general]
bars = 18

[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = 7
" > $config_file

# read stdout from cava
cava -p $config_file | while read -r line; do
    echo $line | sed $dict
done
