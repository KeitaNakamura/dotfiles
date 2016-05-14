autoload -U compinit
zle -N __zcomplete::complete-on
zle -N __zcomplete::complete-off
compinit

ZCOMPLETE_LIST_MAX=20
ZCOMPLETE_HIGHLIGHT_STYLE='fg=8'

function __zcomplete::binded-function() {
  lists="`zle -l`"
  echo "$lists" | awk '/'$1' / {print $2}' | sed -e "s/(\(.*\))/\1/"
}

function __zcomplete::complete-on() {
  ORIG_INSERT="$(__zcomplete::binded-function "self-insert")"
  ORIG_DELETE="$(__zcomplete::binded-function "backward-delete-char")"
  zle -N self-insert __zcomplete::self-insert
  zle -N backward-delete-char __zcomplete::backward-delete-char
}

function __zcomplete::complete-off() {
  if [[ "$ORIG_INSERT" == "" ]]; then
    zle -A .self-insert self-insert
  else
    zle -N self-insert $ORIG_INSERT
  fi
  if [[ "$ORIG_DELETE" == "" ]]; then
    zle -A .backward-delete-char basckward-delete-char
  else
    zle -N basckward-delete-char $ORIG_DELETE
  fi
}

function __zcomplete::limit-list() {
  if ((compstate[nmatches] <= 1)); then
    zle -M ""
  elif ((compstate[list_lines] > ZCOM_LIST_MAX)); then
    compstate[list]=""
    zle -M "too many matches."
  fi
}

function __zcomplete::predict() {
  cursor="$CURSOR"
  comppostfuncs=( __zcomplete::limit-list )
  zle complete-word
  CURSOR="$cursor"
}

function __zcomplete::highlight() {
  _zsh_highlight 2>/dev/null
  region_highlight+=("$CURSOR $#BUFFER fg=8")
}

function __zcomplete::self-insert() {
  BUFFER="$LBUFFER"
  if zle .self-insert; then
    if
      ((PENDING == 0)) &&
      ((CURSOR > 1)) &&
      [[ "$KEYS[-1]" != " " ]] &&
      [[ "$PREBUFFER" == "" ]]
    then
      __zcomplete::predict
    else
      zle -M ""
    fi
  fi
  __zcomplete::highlight
}

function __zcomplete::backward-delete-char() {
  ((CURSOR--))
  BUFFER="$LBUFFER"
}

__zcomplete::complete-on
