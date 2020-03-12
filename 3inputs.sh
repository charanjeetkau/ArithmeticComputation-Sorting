#!/bin/bash -x
read -p "Enter first input number: " a
read -p "Enter second input number: " b
read -p "Enter third input number: " c
res=$(($a+$b*$c))
echo "$a + $b * $c = $res"
res2=$(($a*$b+$c))
echo "$a * $b + $c = $res2"
