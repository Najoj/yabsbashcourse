#!/bin/bash

echo $USER
echo 2 + 2 = `echo 2+2 | bc`

while [[ $A -gt 5 ]];
do
        let ++$A
done

sleep $A 1s

read NAME

echo Hi $NAME. A is now \"$A\".

