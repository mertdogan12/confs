#!/bin/bash
find $(git ls-files)            \
    -type f                     \
    -not -path "*git*"          \
    -a -not -name \*.sh         \
    -a -not -name \*.md         \
    -a -not -path "_config.yml" \

