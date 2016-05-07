#!/bin/bash

DOTPATH=`echo $(cd $(dirname $0) && pwd)`

# vim
mkdir -p ~/.vim
ln -s -i ${DOTPATH}/_vim/spell ~/.vim/
ln -s -i ${DOTPATH}/_vim/templates ~/.vim/
ln -s -i ${DOTPATH}/_vimrc ~/.vimrc
ln -s -i ${DOTPATH}/_gvimrc ~/.gvimrc

# zsh
ln -s -i ${DOTPATH}/_zshrc ~/.zshrc

# ctags
ln -s -i ${DOTPATH}/ctags ~/.ctags

# latexmk
ln -s -i ${DOTPATH}/_latexmkrc ~/.latexmkrc

# matplotlib
mkdir -p ~/.matplotlib
ln -s -i ${DOTPATH}/_matplotlib/matplotlibrc ~/.matplotlib/

# tmux
ln -s -i ${DOTPATH}/tmux/_tmux.conf ~/.tmux.conf
