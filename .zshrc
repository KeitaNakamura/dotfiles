#          _              
#  _______| |__  _ __ ___ 
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__ 
# /___|___/_| |_|_|  \___|
#                         
#

#-------+
# zinit |
#-------+

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

# pure prompt
zinit ice pick"async.zsh" src"pure.zsh"
zinit light "sindresorhus/pure"
export PURE_PROMPT_SYMBOL="❯"
zstyle :prompt:pure:prompt:success color 11
zstyle :prompt:pure:git:branch color '#999999'
zstyle :prompt:pure:git:dirty color '#999999'
zstyle :prompt:pure:git:stash color yellow
zstyle :prompt:pure:git:stash show yes

# zsh-syntax-highlighting
zinit light "zsh-users/zsh-syntax-highlighting"

# zsh-autosuggestions
zinit light "zsh-users/zsh-autosuggestions"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=white,bg=black"

# auto complete
zinit light "marlonrichert/zsh-autocomplete"
zstyle ':autocomplete:*' widget-style menu-select
zstyle ':autocomplete:*' insert-unambiguous no
zstyle ':autocomplete:*' fzf-completion yes

# for `tmuxx`
zinit ice as"command" pick"bin/*"
zinit light "KeitaNakamura/tmux-utils"

#----------+
# Settings |
#----------+

# enable brew completion
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

# highlight
setopt interactivecomments
ZSH_HIGHLIGHT_STYLES[comment]='fg=red,bold'

# fzf
export FZF_DEFAULT_OPTS='
  --bind=ctrl-k:kill-line
  --color=fg:#aabbc4,fg+:#aabbc4,bg:#1f2f38,bg+:#263a45,hl:#658595,hl+:#c99720
  --color=border:#475c69,spinner:#639ee4,header:#658595,info:#639ee4,pointer:#b888e2,marker:#639ee4,prompt:#b888e2
'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
_fzf_comprun() {
  local command=$1
  shift
  case "$command" in
    cd)           fzf "$@" --preview 'tree -C {} | head -200' ;;
    export|unset) fzf "$@" --preview "eval 'echo \$'{}" ;;
    ssh)          fzf "$@" --preview 'dig {}' ;;
    *)            fzf "$@" ;;
  esac
}
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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

#--------------+
# New Commands |
#--------------+

icloud_update() {
  local dir="${HOME}/Library/Mobile Documents/com~apple~CloudDocs/__icolud_update__"
  mkdir "$dir" && sleep 1 && rm -r "$dir"
}
