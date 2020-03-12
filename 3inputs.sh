#!/bin/bash -x
read -p "Enter first input number: " a
read -p "Enter second input number: " b
read -p "Enter third input number: " c
res=`expr "scale=4;$a+$b*$c" | bc -l`
echo "$a + $b * $c = $res"
res2=`expr "scale=4;$a*$b+$c" | bc -l`
echo "$a * $b + $c = $res2"
res3=`expr "scale=4;$c+$a/$b" | bc -l`
echo "$c + $a / $b = $res3"
