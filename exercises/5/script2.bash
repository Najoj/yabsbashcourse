#!/bin/bash

alias WHO="whoami | grep $1"
A=(x y z)

function fun()
{

        << eof while read line; do echo $line; done | tr x s | tr [:upper:] [:lower:]
Tthix ix xome text
which Xix on multiple linex
eof     
}


if ls $HOME; then
        cd $HOME
        LS=ls
fi

if ${DEBUG+x}; then
        # Can set other flags and options here
        echo "Running Debug mode\n"
fi

if which find; then
        find ${HOME} -exec grep 'hello' {} + -type f -iname *.txt -maxdepth 1
fi

if [ -z $@ ] & [[ 2 < "3" ]]; then
        for _ in $@; do echo hello; done | sed sfhellofgoodbye\nf
        for f in "*.txt"; do echo cat $f; done | shuf
fi

sum=0
echo {1..20} | while read i; do (( $i > 20 )) && sum=$(($i+RANDOM + $sum + $A[0]); done

while read line; do echo $line; done << eof
This is some text
which is on multiple lines
eof 

$LS && bash -x function 1 2 3

while getopts "a" f; do
        case $f in "b") echo 'got here';; esac
[ false ] && exit 1
