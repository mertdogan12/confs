#!/bin/bash
distros=("Arch-Linux")

./scripts/$(printf "%s\n" "${distros[@]}" | fzf).sh
./scripts/linkFiles.sh
