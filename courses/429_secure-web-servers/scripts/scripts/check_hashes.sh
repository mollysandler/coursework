#!/bin/bash

backup_dir="../backups/backup"
hash_file="../backups/backup_hashes.txt"

all_match=true

while read -r line; do
	hash=$(echo "$line" | awk '{print $1}')
	file=$(echo "$line" | awk '{print $2}')

	current_hash=$(md5sum "$file" | awk '{print $1}')

	if [ "$hash" != "$current_hash" ]; then
		echo "Mismatch found for $file: Excpected $hash, got $current_hash"
		all_match=false
	fi
done < "$hash_file"

if $all_match; then
	echo "All file hashes match"
fi
