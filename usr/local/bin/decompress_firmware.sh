#!/bin/sh

find /lib/firmware -type f -name "*.zst" | xargs -I {} zstd -dk {}

find /lib/firmware -type l -name "*.zst" | while read -r symlink; do
    target=$(readlink "$symlink")
    new_symlink="${symlink%.zst}"  # Remove .zst extension from symlink
    new_target="${target%.zst}"  # Remove .zst extension from target
    ln -s "$new_target" "$new_symlink"
done

