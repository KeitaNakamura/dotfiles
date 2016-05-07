#!/bin/bash

DOTPATH=`echo $(cd $(dirname $0) && pwd)`

# vim
mkdir -p ~/.vim/colors
ln -sfv ${DOTPATH}/_vim/spell ~/.vim/
ln -sfv ${DOTPATH}/_vim/templates ~/.vim/
ln -sfv ${DOTPATH}/_vimrc ~/.vimrc
ln -sfv ${DOTPATH}/_gvimrc ~/.gvimrc
ln -sfv ${DOTPATH}/colorscheme/railscasts.vim/colors/railscasts.vim ~/.vim/colors/
if ! [ -e '~/.vim/plugged' ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  vim +PlugInstall +qall
fi

# zsh
ln -sfv ${DOTPATH}/_zshrc ~/.zshrc

# ctags
ln -sfv ${DOTPATH}/ctags ~/.ctags

# latexmk
ln -sfv ${DOTPATH}/_latexmkrc ~/.latexmkrc

# matplotlib
mkdir -p ~/.matplotlib
ln -sfv ${DOTPATH}/_matplotlib/matplotlibrc ~/.matplotlib/

# tmux
ln -sfv ${DOTPATH}/tmux/_tmux.conf ~/.tmux.conf
