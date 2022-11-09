#          _              
#  _______| |__  _ __ ___ 
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__ 
# /___|___/_| |_|_|  \___|
#                         
#


#------------------
# zplug
#------------------

if [ ! -d "${HOME}/.zplug" ]; then
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
  zsh
fi

source ~/.zplug/init.zsh
zplug "zplug/zplug"

zplug zsh-users/zsh-syntax-highlighting

# zsh-autosuggestions
zplug zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=white,bg=black"

# auto complete
zplug "marlonrichert/zsh-autocomplete"
zstyle ':autocomplete:*' widget-style menu-select
zstyle ':autocomplete:*' insert-unambiguous no

# for tmux plugin 'tmux-statusbar'
zplug "KeitaNakamura/tmux-utils", as:command, use:"bin/*"

# pure prompt
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
export PURE_PROMPT_SYMBOL="❯❯"
zstyle :prompt:pure:git:branch color '#999999'

zplug check || zplug install
zplug load

#------------------
# Settings
#------------------

setopt interactivecomments
ZSH_HIGHLIGHT_STYLES[comment]='fg=red,bold'

# fzf
export FZF_DEFAULT_OPTS='--bind=ctrl-k:kill-line'

# for iCloud
export iCloud="$HOME/Library/Mobile Documents/com~apple~CloudDocs"

# nvim
alias vim=nvim

# locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# ls color
export CLICOLOR=true
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

#------------------
# New Commands
#------------------

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-*} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

icloud_update() {
  local dir="${HOME}/Library/Mobile Documents/com~apple~CloudDocs/__icolud_update__"
  mkdir "$dir" && sleep 1 && rm -r "$dir"
}
