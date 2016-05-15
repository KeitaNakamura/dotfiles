autoload -U compinit
zle -N __zcomplete::complete-on
zle -N __zcomplete::complete-off
compinit

ZCOMPLETE_LIST_MAX=40

function __zcomplete::binded-function() {
  lists="`zle -l`"
  echo "$lists" | awk '/'$1' / {print $2}' | sed -e "s/(\(.*\))/\1/"
}

function __zcomplete::complete-on() {
  ORIG_INSERT="$(__zcomplete::binded-function "self-insert")"
  ORIG_COMPLETE="$(__zcomplete::binded-function "expand-or-complete")"
  zle -N self-insert __zcomplete::self-insert
  zle -N expand-or-complete __zcomplete::expand-or-complete
}

function __zcomplete::complete-off() {
  if [[ "$ORIG_INSERT" == "" ]]; then
    zle -A .self-insert self-insert
  else
    zle -N self-insert $ORIG_INSERT
  fi
  if [[ "$ORIG_COMPLETE" == "" ]]; then
    zle -A .expand-or-complete expand-or-complete
  else
    zle -N expand-or-complete $ORIG_COMPLETE
  fi
}

function __zcomplete::limit-list() {
  if ((compstate[nmatches] <= 1)); then
    zle -M ""
  elif ((compstate[list_lines] > $ZCOMPLETE_LIST_MAX)); then
    compstate[list]=""
    zle -M "too many matches."
  fi
}

function __zcomplete::highlight() {
  _zsh_highlight 2>/dev/null
}

function __zcomplete::show-list {
  if [[ "$LBUFFER[-2,-1]" == '\ ' ]] ||
     [[ "$LBUFFER[-1]" != ' ' ]]
  then
    comppostfuncs=( __zcomplete::limit-list )
    zle list-choices
  fi
}

function __zcomplete::self-insert() {
  if zle .self-insert; then
    if
      ((PENDING == 0)) &&
      ((CURSOR > 1)) &&
      [[ "$KEYS[-1]" != " " ]] &&
      [[ "$PREBUFFER" == "" ]]
    then
      __zcomplete::show-list
    else
      zle -M ""
    fi
  fi
  __zcomplete::highlight
}

function __zcomplete::expand-or-complete {
  if zle complete-word; then
    __zcomplete::show-list
  else
    zle .expand-or-complete
  fi
  __zcomplete::highlight
}

__zcomplete::complete-on
