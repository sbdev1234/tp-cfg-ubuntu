#!/bin/bash

colors() {

    tput clear

    echo '
black=0
red=1
green=2
yellow=3
blue=4
magenta=5
cyan=6
white=7
'
    [[ $(tput colors) -lt 8 ]] && return

    echo '====
standard colors: Foreground: "
for C in {30..37}; do
    echo -en "\e[${C}m$C "
done'
    for C in {30..37}; do
        echo -en "\e[${C}m$C "
    done
    echo -e "\e(B\e[m"

    echo '====
standard colors: background: 
for C in {40..47}; do
    echo -en "\e[${C}m$C "
done'
    for C in {40..47}; do
        echo -en "\e[${C}m$C "
    done
    echo -e "\e(B\e[m"

    echo '====
high intensity colors: foreground
for C in {90..97}; do
    echo -en "\e[${C}m$C "
done'
    for C in {90..97}; do
        echo -en "\e[${C}m$C "
    done
    echo -e "\e(B\e[m"

    echo '====
high intensity colors: background"
for C in {100..107}; do
    echo -en "\e[${C}m$C "
done'
    for C in {100..107}; do
        echo -en "\e[${C}m$C "
    done
    echo -e "\e(B\e[m"

    echo '====
256 terminal foreground colors
for C in {16..255}; do
    echo -en "\e[38;5;${C}m$C "
done'
    for C in {16..255}; do
        echo -en "\e[38;5;${C}m$C "
    done
    echo -e "\e(B\e[m"

    echo '====
256 terminal background colors
for C in {16..255}; do
    echo -en "\e[48;5;${C}m$C "
done'
    for C in {16..255}; do
        echo -en "\e[48;5;${C}m$C "
    done
    echo -e "\e(B\e[m"
    echo "===="
}
colors

