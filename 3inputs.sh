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


#for a in "${array[@%.*]}"; do echo "$a"; done | sort
temp=0
for((i=0; i<${#array[@]}; i++))
do

    for((j=i+1; j<${#array[@]}; j++))
    do
        #echo "sort test" ${array[i]%.*}
        if [[ ${array[i]%.*} -gt ${array[j]%.*} ]]
        then
            temp=${array[i]}
            array[i]=${array[j]}
            array[j]=$temp
        fi
    done
done

#array=($(printf "%s\n" ${array[@]} | sort -r ))
echo 'Sorted array in ascending order: ' ${array[@]}
l=0
for((k=${#array[@]}; k>=0; k--))
do
array2[l]=${array[k]}
((l++))
done
echo 'Sorted array in descending order: ' ${array2[@]}

