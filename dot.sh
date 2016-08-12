#!/bin/sh

DOT_DIR=~/p/dotfiles
DOTS='~/.zshrc:_zshrc:ZSH config
	~/.tmux.conf:_tmux.conf:tmux config
	~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/*.sublime-settings:sublime2:Sublime2 settings'

cd $DOT_DIR

if [ $# = 1 ]; then
	action=$1
	OLD_IFS=$IFS
	IFS=$'\t\n'

	for i in $DOTS
	do
		src=$(echo "$i" | cut -d : -f 1)
		dest=$(echo "$i" | cut -d : -f 2)
		desc=$(echo "$i" | cut -d : -f 3)

		case $action in
				list)
					printf "%s\t\t%s\t\t%s\n" $src $dest $desc
					;;
				copy)
					cmd='cp '$src' '$dest
					sh -c $cmd
					;;
		esac
	done
	IFS=${OLD_IFS}
else
	echo "Usage: dot list|copy"
fi

