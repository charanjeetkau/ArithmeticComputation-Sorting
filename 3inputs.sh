#!/bin/bash -x
read -p "Enter first input number: " a
read -p "Enter second input number: " b
read -p "Enter third input number: " c
res1=`expr "scale=4;$a+$b*$c" | bc -l`
echo "$a + $b * $c = $res1"
res2=`expr "scale=4;$a*$b+$c" | bc -l`
echo "$a * $b + $c = $res2"
res3=`expr "scale=4;$c+$a/$b" | bc -l`
echo "$c + $a / $b = $res3"
res4=`expr "scale=4;$a%$b+$c" | bc -l`
echo "$a % $b + $c = $res4"

declare -A results
results[1]=$res1
results[2]=$res2
results[3]=$res3
results[4]=$res4
echo ${!results[@]} ' : ' ${results[@]}

declare -a array
array[0]=${results[1]}
array[1]=${results[2]}
array[2]=${results[3]}
array[3]=${results[4]}
echo 'Array: '${array[@]}

