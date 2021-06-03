#!/bin/bash

DEFAULT_TERM=xfce4-terminal # or gnome-terminal, or uxterm, or xterm

$DEFAULT_TERM -e $PWD/test-vmrt.sh | tee test-vmrt.log
sleep 4 # Spinning uprust ... just wait meatbag!
$DEFAULT_TERM -e $PWD/test-com.sh | tee test-com.log

