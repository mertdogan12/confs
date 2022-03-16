#!/bin/bash
for i in $(find $(git ls-files)              \
    -type f                                 \
    -not -path ".gitignore"                 \
    -a -not -name \*.sh                     \
    -a -not -name \*.md                     \
    -a -not -path "_config.yml"             \
    -a -not -path "selected"                \
    -a -not -path "screenshot.png"); do	
	rm -v ~/$i
	mkdir -p ~/$(dirname $i)
	ln -s ~/.dotfiles/$i ~/$i
done
