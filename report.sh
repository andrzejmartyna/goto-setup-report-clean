#!/bin/bash

HERE_I_AM=$(dirname "${BASH_SOURCE[0]}")
echo "$HERE_I_AM"
source "$HERE_I_AM/modules/common.sh"

success=0
if [ $# -gt 0 ]; then
	success=1
	if [ $1 = "git_pretty_log" ]; then
		git log --pretty=format:'%C(yellow)%h %Cred%ai %Cblue%an%Cgreen%d %Creset%s' --date=short $1
	elif [ $1 = "where_i_am" ]; then
		echo "The shell is"
		echo $SHELL
		echo "Tips for customizations depending on the shell"
		echo "Shell configuration files: ~/.zshrc, ~/.bashrc, ~/.bash_profile"
	else
		success=0
	fi
fi

if [[ $success -ne 1 ]]; then
	echo -e "${RED}USE: report.sh with one of the forms:${NC}"
    echo -e "${YELLOW}    - report.sh git_pretty_log -n X --> pretty prints git log with given number of commits${NC}"
    echo -e "${YELLOW}    - report.sh where_i_am --> reports some information about place you are now${NC}"
	exit 1
fi
