#!/bin/bash

a=${1}
b=${2}
c=${3}

d=$(echo "${b}*${b}-4*${a}*${c}" | bc -l)
#echo $d

if [[ "$d" == "0" ]]; then
	x=$(echo "scale=2; -${b}/2/${a}" | bc -l)
	echo "Ответ: x = ${x}"
elif [ $(echo "${d}>0" | bc) -eq 1 ]; then
	s_d=$(echo "sqrt(${d})" | bc -l)
#	echo "s_d = ${s_d}"
	x1=$(echo "-1*${b}+${s_d}" | bc -l)
	x2=$(echo "-1*${b}-${s_d}" | bc -l)
	x1=$(echo "scale=2; ${x1}/2/${a}" | bc -l)
	x2=$(echo "scale=2; ${x2}/2/${a}" | bc -l)
	echo "Ответ: x1 = ${x1}, x2 = ${x2}"
else
	s_d=$(echo "sqrt(-1*${d})" | bc -l)
	real_part=$(echo "scale=2; -${b}/2/${a}" | bc -l)
	im_part=$(echo "scale=2; ${s_d}/2/${a}" | bc -l)

	echo "Ответ: x1 = ${real_part}+${im_part}i, x2 = ${real_part}-${im_part}i"
fi
