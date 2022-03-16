#!/bin/bash
find $(git ls-files)                \
    -type f                         \
    -not -path "*git*"              \
    -a -path ".gitconfig"           \
    -a -not -name \*.sh             \
    -a -not -name \*.md             \
    -a -not -path "_config.yml"     \
    -a -not -path "selected"        \
    -a -not -path "screenshot.png"

