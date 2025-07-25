#!/bin/bash

# credits to **a great StackOverflow answer** regarding colors:
# https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
RRed='\033[0;31m'
RYellow='\033[0;33m'
RGreen='\033[0;32m'
BRed='\033[1;31m'
BYellow='\033[1;33m'
BGreen='\033[1;32m' 
RED=$BRed
YELLOW=$BYellow
GREEN=$BGreen
NC='\033[0m' # No Color

is_sourced() {
	if [ "${#FUNCNAME[@]}" -ne "2" ] || [ "${FUNCNAME[1]}" != "source" ]; then
		return 0
	else
		return 1
	fi
}

ensure_is_sourced() {
	is_sourced
	if [ "$?" -ne "1" ]; then
		echo "This script modifies the calling session."
		echo "It means you have to run this script in 'sourced' mode so by using dot-space-script like this:"
		echo ". script.sh ...."
		exit 1
	fi
}
