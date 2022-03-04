#!/bin/bash
distros=("Ubuntu" "Arch-Linux")

./scripts/$(printf "%s\n" "${distros[@]}" | fzf).sh
