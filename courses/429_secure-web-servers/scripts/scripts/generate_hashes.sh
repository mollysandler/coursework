#!/bin/bash

backup_dir="../backups/backup"
hash_file="../backups/backup_hashes.txt"

mkdir -p $(dirname "$hash_file")

> "$hash_file"

function hash_directory() {
	local path="$1"
	for file in "$path"/*; do
		if [ -d "$file" ]; then
			hash_directory "$file"
		else
			echo "Hashing file: $file into $hash_file"
			md5sum "$file" >> "$hash_file"
		fi
	done
}

hash_directory "$backup_dir"

echo "Hashes have been saved to $hash_file"
