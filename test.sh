#!/bin/bash

DEFAULT_TERM=xfce4-terminal # or gnome-terminal, any terminal should do.

$DEFAULT_TERM -e "bash -c \"$PWD/vmrt.sh | tee $PWD/log_vmrt.log; exec bash \""

sleep 2 # Spinning uprust ... just wait meatbag!

"$PWD"/com.sh > "$PWD"/log_com.log &

