#!/bin/bash
# cd to script dir
script_dir=$0
script_dir=$(realpath $script_dir)
script_dir=$(dirname $script_dir)
cd $script_dir

# Define the directory where you want to search
search_dir="${1:-.}"
# Define the directory where you want to copy the files
dest_dir="$2"

mkdir -p $dest_dir
clean_files=(
	Windows
)

find_files=(
	wav
	3pg
	mp3
)

# Find and copy media files with specific extensions
for clean_file in ${clean_files[@]}
do
	for find_file in ${find_files[@]}
	do
		find "$search_dir"  \
			-iname "$clean_file*$find_file" \
	  		-exec rm -v {} "$dest_dir" \;
	done
done
echo -e "\a\a\a\a\a\a\a\b\b\b"
echo "All media files have been copied to $dest_dir"
