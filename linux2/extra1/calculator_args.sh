#!/bin/bash
# Grep for arithmetic operator
operator=$(echo "${*}" | egrep -o '(\+|-|\*|\/)')

# Clean input
args=$(echo "${*}" | egrep -o '[0-9\+-\*\/]')

# Get numbers
num1=$(echo $args | cut -d "${operator}" -f 1)
num2=$(echo $args | cut -d "${operator}" -f 2)

# Perform calculation
echo $((${num1}${operator}${num2}))
