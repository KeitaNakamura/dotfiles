#!/bin/bash

DOTPATH=`echo $(cd $(dirname $0) && pwd)`


function install_packages()
{
  # Command line tools for Xcode
  # ----------------------------
  xcode-select --install

  # Homebrew
  # --------
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  # Shell
  # -----
  brew install zsh
  brew install zsh-completions
  ZSH_PATH="/usr/local/bin/zsh"
  sudo -sh -c "echo $ZSH_PATH >> /etc/shells"
  chsh -s $ZSH_PATH
  # exec $ZSH_PATH -l

  # Shell utilities
  # ---------------
  brew install fzf
  brew install tmux
  brew install ag
  brew install ctags
  brew install pandoc
  brew install cmake

  # Vim
  # ---
  brew install vim --with-lua
  brew install macvim --with-lua
  brew linkapps macvim

  # Python
  # ------
  brew install python
  pip install matplotlib
  pip install jupyter

  # Julia
  # -----
  brew tap staticfloat/julia
  brew install julia
  julia -e 'for x in ARGS; Pkg.add($x); using end' \
    PyPlot ProgressMeter DataFrames IJulia

  # Font
  # ----
  brew tap sanemat/font
  brew install ricty --vim-powerline
  cp -f /usr/local/Cellar/ricty/3.2.4/share/fonts/Ricty*.ttf ~/Library/Fonts/
  fc-cache -vf
}

function install_applications()
{
  brew tap caskroom/cask

  # Developer Tools
  brew cask install sourcetree
  brew cask install atom

  # Productivity
  brew cask install evernote
  brew cask install mendeley-desktop
  brew cask install paraview

  # Social Networking
  brew cask install skype

  # Tools
  brew cask install skim
  brew cask install vlc

  # Utilities
  brew cask install alfred
  brew cask install appcleaner
  brew cask install iterm2
  brew cask install dropbox
  brew cask install karabiner
  brew cask install insomniax
  brew cask install the-unarchiver
}

function install_settings()
{
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
}

install_settings
