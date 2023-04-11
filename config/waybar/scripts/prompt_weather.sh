#!/bin/bash
file=${RANDOM}
echo 'What is your city?:'
read city1
city2="$(echo ${city1} | sed 's#[[:space:]]#_#g')"

w3m https://wttr.in/"${city2}"