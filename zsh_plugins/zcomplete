# Created by K.Nakamura on 2016-05-16.
# e-mail: nakamura-keita-kn@ynu.jp

zle -N self-insert zcomplete-self-insert
zle -N expand-or-complete zcomplete-expand-or-complete
zle -N backward-delete-char zcomplete-backward-delete-char

zcomplete-binded-function() {
  local lists="`zle -l`"
  local func=`echo "$lists" | awk '/'^$1' / {print $2}'`
  if [ `echo "$func" | grep '('` ]; then
    echo "$func" | sed -e "s/(\(.*\))/\1/"
  else
    echo ""
  fi
}

zcomplete-limit-list() {
  if (( compstate[list_lines]+BUFFERLINES > LINES ||
    ( compstate[list_max] != 0 &&
	    compstate[nmatches] > compstate[list_max] ) ))
  then
    compstate[list]=''
    zle -M "Too many matches ($compstate[nmatches])"
  fi
}

zcomplete-show-list() {
  if
    ((CURSOR > 1)) && (
    [[ "$LBUFFER[-2,-1]" == '\ ' ]] ||
    [[ "$LBUFFER[-1]" != ' ' ]]
    )
  then
    comppostfuncs=( zcomplete-limit-list )
    zle list-choices
  fi
}

zcomplete-self-insert() {
  if zle .self-insert; then
      zcomplete-show-list
  fi
}

zcomplete-expand-or-complete() {
  if zle complete-word; then
      zcomplete-show-list
  else
    zle .expand-or-complete
  fi
}

zcomplete-backward-delete-char() {
  if zle .backward-delete-char; then
    zcomplete-show-list
  fi
}
