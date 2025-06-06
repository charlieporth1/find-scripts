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

# Find and copy media files with specific extensions
./photo-find.sh $search_dir $dest_dir/photo
./video-find.sh $search_dir $dest_dir/video
./audio-find.sh $search_dir $dest_dir/audio

echo -e "\a\a\a\a\a\a\a\b\b\b"
echo "All media files have been copied to $dest_dir"
