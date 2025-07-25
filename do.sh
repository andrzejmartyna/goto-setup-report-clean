#!/bin/bash

# CONSIDER TO ADD
# set_execution_flag which does whatever is needed underneath:
# - git update-index --chmod=+x filename.sh
# - git add --chmod=+x filename.sh
# - chmod +x filename.sh

HERE_I_AM=$(dirname "${BASH_SOURCE[0]}")
source "$HERE_I_AM/modules/common.sh"

success=0
if [ $# -gt 0 ]; then
	success=1
	if [ $1 = "git_commit_all" ]; then
		git add . && git commit -m "$1"
	elif [ $1 = "git_push_all" ]; then
		git add . && git commit -m "$1" && git push
	else
		success=0
	fi
fi

if [[ $success -ne 1 ]]; then
	echo -e "${RED}USE: do.sh with one of the forms:${NC}"
    echo -e "${YELLOW}    - do.sh git_commit_all '<commit message>' --> does: git add . && git commit -m <msg>${NC}"
    echo -e "${YELLOW}    - do.sh git_push_all '<commit message>' --> BE CAREFUL, BE MINDFUL as it does: git add . && git commit -m <msg> && git push${NC}"
	exit 1
fi
