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
	if [ $1 = "git_pretty_log" ]; then
		if [ $# -gt 1 ]; then
			git log --pretty=format:'%C(yellow)%h %Cred%ai %Cblue%an%Cgreen%d %Creset%s' --date=short -n $2
		else
			git log --pretty=format:'%C(yellow)%h %Cred%ai %Cblue%an%Cgreen%d %Creset%s' --date=short
		fi
		success=1
	elif [ $1 = "where_i_am" ]; then
		printf "The shell is\n"
		printf "$SHELL\n"
		printf "Tips for customizations depending on the shell\n"
		printf "Shell configuration files: ~/.zshrc, ~/.bashrc, ~/.bash_profile\n"
		success=1
	fi
fi

if [[ $success -ne 1 ]]; then
	printf "${RED}USE: report.sh with one of the forms:${NC}\n"
    printf "${YELLOW}    - report.sh git_pretty_log --> pretty prints git log with given number of commits${NC}\n"
    printf "${YELLOW}    - report.sh git_pretty_log X --> pretty prints git log with given number of commits${NC}\n"
    printf "${YELLOW}    - report.sh where_i_am --> reports some information about place you are now${NC}\n"
fi
