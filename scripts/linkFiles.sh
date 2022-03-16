#!/bin/bash
for i in $(find $(git ls-files)             \
    -type f                                 \
    -not -path ".gitignore"                 \
    -a -not -name \*.sh                     \
    -a -not -name \*.md                     \
    -a -not -path "_config.yml"             \
    -a -not -path "selected"                \
    -a -not -path "screenshot.png"); do	

    # Backing up the config files
	mkdir -p ~/mdd_backup/$(dirname $i)
    cp ~/$i ~/mdd_backup/$i

    # Linking the config files
	rm ~/$i
	mkdir -p ~/$(dirname $i)
	ln -s ~/.dotfiles/$i ~/$i
done

echo "Backup created at $HOME/mdd_backup"
