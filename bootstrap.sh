#!/usr/bin/env bash

cd "$(dirname "$0")"
DOTFILES_ROOT=$(pwd -P)
echo $DOTFILES_ROOT

# git pull origin master;

function doIt() {
	for name in .jupyter .aliases .bash_profile .bash_prompt .bashrc .exports .functions .gitconfig .hushlogin .inputrc .screenrc .tmux.conf .vimrc .wgetrc
	do
		rm -rf $HOME/$name || true
		ln -s $DOTFILES_ROOT/$name $HOME/$name
	source ~/.bash_profile;
  done
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
