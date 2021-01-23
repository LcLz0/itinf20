#!/bin/bash
# Grep for arithmetic operator
operator=$(echo "${@}" |egrep -o '(\+|-|\*|\/)')

# Get numbers
num1=$(echo $@ | cut -d "${operator}" -f 1)
num2=$(echo $@ | cut -d "${operator}" -f 2)

# Perform calculation
echo $((${num1}${operator}${num2}))
