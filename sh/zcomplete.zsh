# Created by K.Nakamura on 2016-05-16.
# e-mail: nakamura-keita-kn@ynu.jp

zle -N __zcomplete::complete-on
zle -N __zcomplete::complete-off

function __zcomplete::binded-function() {
  local lists="`zle -l`"
  echo "$lists" | awk '/'^$1' / {print $2}' | sed -e "s/(\(.*\))/\1/"
}

function __zcomplete::complete-on() {
  local widgets=('self-insert' 'expand-or-complete' 'backward-delete-char')
  for w in "${widgets[@]}"
  do
    zle -N ${w}-orig "$(__zcomplete::binded-function "${w}")"
    zle -N ${w} __zcomplete::${w}
  done
}

function __zcomplete::complete-off() {
  local widgets=('self-insert' 'expand-or-complete' 'backward-delete-char')
  for w in "${widgets[@]}"
  do
    if [[ "$(__zcomplete::binded-function "${w}-orig")" == "" ]]; then
      zle -A .$w $w
    else
      zle -A ${w}-orig $w
      zle -D ${w}-orig
    fi
  done
}

function __zcomplete::limit-list() {
  if ((compstate[list_lines] + BUFFERLINES + 2 > LINES)); then
    compstate[list]=''
    zle -M "Too many matches ($compstate[list_lines] lines)"
  fi
}

function __zcomplete::highlight() {
  _zsh_highlight 2>/dev/null
}

function __zcomplete::show-list {
  if
    ((CURSOR > 1)) && (
    [[ "$LBUFFER[-2,-1]" == '\ ' ]] ||
    [[ "$LBUFFER[-1]" != ' ' ]]
    )
  then
    comppostfuncs=( __zcomplete::limit-list )
    zle list-choices
  fi
  __zcomplete::highlight
}

function __zcomplete::self-insert() {
  if zle .self-insert; then
      __zcomplete::show-list
  fi
}

function __zcomplete::expand-or-complete {
  if zle complete-word; then
      __zcomplete::show-list
  else
    zle .expand-or-complete
    __zcomplete::highlight
  fi
}

function __zcomplete::backward-delete-char {
  if zle .backward-delete-char; then
    __zcomplete::show-list
  fi
}

__zcomplete::complete-on
