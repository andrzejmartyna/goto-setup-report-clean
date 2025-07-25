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
	if [ $1 = "repo" ]; then
		if is_sourced; then
			code_dir="/Users/andrzej/Documents/CODE"
			search_str="$2"

			# Find directories up to 2 levels deep, matching search_str, excluding those ending with sha1 or sha2
			found_files=$(noglob find "$code_dir" -maxdepth 2 -type d -iname "*$search_str*" 2>/dev/null)
			if [ -z "$found_files" ]; then
				printf "Warning: No directories found containing '$search_str'\n"
			else
				line_count=$(wc -l <<< "$found_files" | xargs)
				if [ "$line_count" = "1" ]; then
					printf "$found_files\n"
					cd "$found_files"
				else
					printf "Multiple matches found:\n"
					printf '%s\n' "$found_files"
					printf "Please provide a more specific search term to narrow down to one result\n"
				fi
			fi
			success=1
		fi
	fi
fi

if [[ $success -ne 1 ]]; then
	printf "${RED}USE: goto.sh with one of the forms:${NC}\n"
    printf "${YELLOW}    - goto.sh repo <repo_name_or_part_of_it>${NC}\n"
fi
