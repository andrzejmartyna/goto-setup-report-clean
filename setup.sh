#!/bin/bash

HERE_I_AM=$(dirname "${BASH_SOURCE[0]}")
source "$HERE_I_AM/modules/common.sh"

success=0
if [ $# -gt 0 ]; then
	success=1
	if [ $1 = "editor_code" ]; then
		ensure_is_sourced

		echo "Before: EDITOR=$EDITOR"
		echo "Before: K9S_EDITOR=$K9S_EDITOR"
		echo "Before: KUBE_EDITOR=$KUBE_EDITOR"

		export EDITOR="code -w"
		export K9S_EDITOR="code -w"
		export KUBE_EDITOR="code -w"

		echo "After: EDITOR=$EDITOR"
		echo "After: K9S_EDITOR=$K9S_EDITOR"
		echo "After: KUBE_EDITOR=$KUBE_EDITOR"
	elif [ $1 = "editor_nano" ]; then
		ensure_is_sourced

		echo "Before: EDITOR=$EDITOR"
		echo "Before: K9S_EDITOR=$K9S_EDITOR"
		echo "Before: KUBE_EDITOR=$KUBE_EDITOR"

		export EDITOR=nano
		export K9S_EDITOR=nano
		export KUBE_EDITOR=nano

		echo "After: EDITOR=$EDITOR"
		echo "After: K9S_EDITOR=$K9S_EDITOR"
		echo "After: KUBE_EDITOR=$KUBE_EDITOR"
	else
		success=0
	fi
fi

if [[ $success -ne 1 ]]; then
	echo -e "${RED}USE: setup.sh with one of the forms:${NC}"
    echo -e "${YELLOW}    - setup.sh editor_code --> setup Visual Studio Code as an editor in common tools${NC}"
    echo -e "${YELLOW}    - setup.sh editor_nano --> setup nano as an editor in common tools${NC}"
	exit 1
fi
