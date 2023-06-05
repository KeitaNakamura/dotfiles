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

# zsh-completions
zinit light "zsh-users/zsh-completions"
zstyle ':completion:::::default' menu yes select             # always say yes when showning menu (https://unix.stackexchange.com/questions/563774/how-to-tell-zsh-to-directly-enter-the-auto-completion-list)
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' # case-insensitive matching (https://superuser.com/questions/1092033/how-can-i-make-zsh-tab-completion-fix-capitalization-errors-for-directories-and)
autoload -Uz compinit && compinit

# auto complete
# zinit light "marlonrichert/zsh-autocomplete"
# bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
# bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete
# # zstyle ':autocomplete:*' insert-unambiguous no
# # zstyle ':autocomplete:*' fzf-completion yes

# zsh-syntax-highlighting
zinit light "zsh-users/zsh-syntax-highlighting"

# zsh-autosuggestions
zinit light "zsh-users/zsh-autosuggestions"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=white,bg=black"

# fzf
zinit ice from"gh-r" as"program"
zinit light "junegunn/fzf"
## fzf key bindings and fuzzy completion
zinit ice depth"1" \
  id-as"fzf-extensions" \
  pick"/dev/null" \
  multisrc"shell/{completion,key-bindings}.zsh"
zinit light "junegunn/fzf"

# bat
zinit ice from"gh-r" as"program" mv"bat* -> bat" pick"bat/bat"
zinit light "sharkdp/bat"

# diff-so-fancy
zinit ice from"gh-r" as"program"
zinit light "so-fancy/diff-so-fancy"

# for `tmuxx`
zinit ice as"program" pick"bin/*"
zinit light "KeitaNakamura/tmux-utils"

#----------+
# Settings |
#----------+

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY_TIME

# enable zsh completion
case "$OSTYPE" in
  darwin*)
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  ;;
  linux*)
  ;;
esac

# highlight
setopt interactivecomments
ZSH_HIGHLIGHT_STYLES[comment]='fg=red,bold'

# fzf
export FZF_DEFAULT_OPTS='
  --bind=ctrl-k:kill-line
  --color=fg:bright-black,fg+:bright-black,bg:black,bg+:black,hl:bright-white,hl+:bright-yellow
  --color=border:bright-black,spinner:bright-blue,header:bright-black,info:blue,pointer:magenta,marker:bright-blue,prompt:magenta
'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
_fzf_comprun() {
  local command=$1
  shift
  case "$command" in
    cd)           fzf "$@" --preview 'tree -C {} | head -200' ;;
    vim)          fzf "$@" --preview 'bat --theme=Aurora --color=always {} 2>/dev/null || tree -C {} | head -200' --preview-window '~3' ;;
    export|unset) fzf "$@" --preview "eval 'echo \$'{}" ;;
    ssh)          fzf "$@" --preview 'dig {}' ;;
    *)            fzf "$@" ;;
  esac
}

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
