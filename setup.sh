# DO NOT ADD SHEBANG
# THE SCRIPT WILL CHECK IF IT IS ZSH OR NOT
# Note also that shebang works differently when you run the script or source the script

# credits to **a great StackOverflow answer** regarding colors:
# https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-printf-in-linux
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
	sourced=0
	if [ -n "$ZSH_VERSION" ]; then
		if [[ $ZSH_EVAL_CONTEXT == *:file:shfunc ]]; then
			sourced=1
		fi
	else
		if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
			sourced=1
		fi
	fi
	if [[ $sourced -eq 1 ]]; then
		[[ 1 == 1 ]]
	else
		printf "This script modifies the calling session.\n"
		printf "It means you have to run this script in 'sourced' mode so by using dot-space-script like this:\n"
		printf ". script.sh ....\n"
		[[ 0 == 1 ]]
	fi
}

##### COMMON PART ENDS HERE
##### It was not possible to place it in kind of "modules/common.sh" and source it
##### ... because there is no easy way to guess physical real path of the script if it is called from some place in sourced mode
##### (the path from where the script is called is then resolved not the physical path of the script called)
##### HERE_I_AM=$(dirname "${BASH_SOURCE[0]}")
##### source "$HERE_I_AM/modules/common.sh"

success=0
if [ $# -gt 0 ]; then
	if [ $1 = "editor_code" ]; then
		if is_sourced; then
			printf "Before: EDITOR=$EDITOR\n"
			printf "Before: K9S_EDITOR=$K9S_EDITOR\n"
			printf "Before: KUBE_EDITOR=$KUBE_EDITOR\n"

			export EDITOR="code -w"
			export K9S_EDITOR="code -w"
			export KUBE_EDITOR="code -w"

			printf "After: EDITOR=$EDITOR\n"
			printf "After: K9S_EDITOR=$K9S_EDITOR\n"
			printf "After: KUBE_EDITOR=$KUBE_EDITOR\n"
			success=1
		fi
	elif [ $1 = "editor_nano" ]; then
		if is_sourced; then
			printf "Before: EDITOR=$EDITOR\n"
			printf "Before: K9S_EDITOR=$K9S_EDITOR\n"
			printf "Before: KUBE_EDITOR=$KUBE_EDITOR\n"

			export EDITOR=nano
			export K9S_EDITOR=nano
			export KUBE_EDITOR=nano

			printf "After: EDITOR=$EDITOR\n"
			printf "After: K9S_EDITOR=$K9S_EDITOR\n"
			printf "After: KUBE_EDITOR=$KUBE_EDITOR\n"
			success=1
		fi
	fi
fi

if [[ $success -ne 1 ]]; then
	printf "${RED}USE: setup.sh with one of the forms:${NC}\n"
    printf "${YELLOW}    - . setup.sh editor_code --> setup Visual Studio Code as an editor in common tools${NC}\n"
    printf "${YELLOW}    - . setup.sh editor_nano --> setup nano as an editor in common tools${NC}\n"
fi
