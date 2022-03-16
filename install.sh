#!/bin/bash
distros=("Arch-Linux" "Ubuntu")

./scripts/$(printf "%s\n" "${distros[@]}" | fzf).sh
./scripts/linkFiles.sh
