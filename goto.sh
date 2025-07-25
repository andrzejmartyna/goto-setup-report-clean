#!/bin/bash

echo "${BASH_SOURCE[-1]}"
echo "${BASH_SOURCE[0]}"

HERE_I_AM=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "$HERE_I_AM"x
source "$HERE_I_AM/modules/common.sh"

success=0
if [ $# -gt 0 ]; then
	success=1
	if [ $1 = "repo" ]; then
		ensure_is_sourced
		code_dir="/Users/andrzej/Documents/CODE"
		search_str="$2"

		# Find directories up to 2 levels deep, matching search_str, excluding those ending with sha1 or sha2
		mapfile -t found_dirs < <(find "$code_dir" -maxdepth 2 -type d -iname "*$search_str*" 2>/dev/null)

		case ${#found_dirs[@]} in
			0)
				echo "Warning: No directories found containing '$search_str'"
				;;
			1)
				cd "${found_dirs[0]}"
				;;
			*)
				echo "Multiple matches found:"
				printf '%s\n' "${found_dirs[@]}"
				echo "Please provide a more specific search term to narrow down to one result"
				;;
		esac
	else
		success=0
	fi
fi

if [[ $success -ne 1 ]]; then
	echo -e "${RED}USE: goto.sh with one of the forms:${NC}"
    echo -e "${YELLOW}    - goto.sh repo <repo_name_or_part_of_it>${NC}"
	exit 1
fi
