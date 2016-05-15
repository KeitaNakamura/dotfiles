autoload -U compinit
zle -N __zcomplete::complete-on
zle -N __zcomplete::complete-off
compinit

ZCOMPLETE_LIST_MAX=40
ZCOMPLETE_HIGHLIGHT_STYLE='fg=8'

function __zcomplete::binded-function() {
  lists="`zle -l`"
  echo "$lists" | awk '/'$1' / {print $2}' | sed -e "s/(\(.*\))/\1/"
}

function __zcomplete::complete-on() {
  ORIG_INSERT="$(__zcomplete::binded-function "self-insert")"
  ORIG_DELETE="$(__zcomplete::binded-function "backward-delete-char")"
  # ORIG_FINISH="$(__zcomplete::binded-function "zle-line-finish")"
  zle -N self-insert __zcomplete::self-insert
  # zle -N backward-delete-char __zcomplete::backward-delete-char
  # zle -N complete-word __zcomplete::complete-word
  # zle -N expand-or-complete __zcomplete::expand-or-complete
  # zle -N zle-line-finish __zcomplete::line-finish
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
  # if [[ "$ORIG_FINISH" == "" ]]; then
    # zle -A .zle-line-finish zle-line-finish
  # else
    # zle -N zle-line-finish $ORIG_FINISH
  # fi
}

function __zcomplete::limit-list() {
  if ((compstate[nmatches] <= 1)); then
    zle -M ""
  elif ((compstate[list_lines] > $ZCOMPLETE_LIST_MAX)); then
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

function __zcomplete::show-list {
  if [[ "$LBUFFER[-2,-1]" == '\ ' ]] ||
     [[ "$LBUFFER[-1]" != ' ' ]]
  then
    comppostfuncs=( __zcomplete::limit-list )
    zle list-choices

    # rbuffer="$RBUFFER"

    # BUFFER="$LBUFFER"
    # cursor="$CURSOR"
    # comppostfuncs=( __zcomplete::limit-list )
    # zle complete-word
    # region_highlight+=("$cursor $CURSOR fg=8")

    # rbuffer=`echo "$rbuffer" | sed -e "s/^$BUFFER[$cursor,$CURSOR]//" 2>/dev/null`

    # BUFFER="$BUFFER$rbuffer"
    # CURSOR="$cursor"
  fi
}

function __zcomplete::highlight() {
  _zsh_highlight 2>/dev/null
  region_highlight+=("$CURSOR $#BUFFER fg=8")
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
      # comppostfuncs=( __zcomplete::limit-list )
      # zle list-choices
    else
      zle -M ""
    fi
  fi

  # BUFFER="$LBUFFER"
  # if zle .self-insert; then
    # if
      # ((PENDING == 0)) &&
      # ((CURSOR > 1)) &&
      # [[ "$KEYS[-1]" != " " ]] &&
      # [[ "$PREBUFFER" == "" ]]
    # then
      # __zcomplete::predict
    # else
      # zle -M ""
    # fi
  # fi
  # __zcomplete::highlight
}

function __zcomplete::backward-delete-char() {
  # zle .backward-delete-char
  # __zcomplete::show-list
  # ((CURSOR--))
  # BUFFER="$LBUFFER"
  # __zcomplete::highlight
}

function __zcomplete::line-finish() {
  BUFFER="$LBUFFER"
}

function __zcomplete::complete-word() {
  comppostfuncs=( __zcomplete::limit-list )
  zle .complete-word
  return $?
}

function __zcomplete::expand-or-complete
{
  # BUFFER="$LBUFFER"
  if zle complete-word; then
    __zcomplete::show-list
  else
    zle .expand-or-complete
  fi
  # comppostfuncs=( __zcomplete::limit-list )
  # zle list-choices
  # zle -R ""
  # if [[ "$RBUFFER" == "" ]]; then
    # zle .expand-or-complete
  # else
    # BUFFER="$LBUFFER"
    # __zcomplete::complete-word
    # if [[ "$LBUFFER[-2,-1]" == '\ ' ]] ||
       # [[ "$LBUFFER[-1]" != " " ]]
    # then
      # __zcomplete::complete-word
    # fi
  # fi
}


__zcomplete::complete-on
