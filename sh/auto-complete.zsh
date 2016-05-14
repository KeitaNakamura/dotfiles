autoload -U compinit
zle -N zcom::complete-on
zle -N zcom::complete-off
# zle -N zcom::expand-or-complete
compinit

function zcom::binded-function()
{
  lists="`zle -l`"
  echo "$lists" | awk '/'$1' / {print $2}' | sed -e "s/(\(.*\))/\1/"
}

function zcom::complete-on()
{
  ORIG_INSERT="`zcom::binded-function "self-insert"`"
  ORIG_DELETE="`zcom::binded-function "backward-delete-char"`"
  zle -N self-insert zcom::self-insert
  zle -N backward-delete-char zcom::backward-delete-char
  # zle -N expand-or-complete zcom::expand-or-complete
}

function zcom::complete-off()
{
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

function zcom::limit-list()
{
  if ((compstate[nmatches] <= 1)); then
    zle -M ""
  elif ((compstate[list_lines] > 40)); then
    compstate[list]=""
    zle -M "too many matches."
  fi
}

function zcom::predict()
{
  cursor="$CURSOR"
  comppostfuncs=( zcom::limit-list )
  zle complete-word
  CURSOR="$cursor"
}

function zcom::highlight()
{
  _zsh_highlight 2>/dev/null
  region_highlight+=("$CURSOR $#BUFFER fg=8")
}

function zcom::self-insert()
{
  BUFFER="$LBUFFER"
  if zle .self-insert; then
    if
      ((PENDING == 0)) &&
      ((CURSOR > 1)) &&
      [[ "$KEYS[-1]" != " " ]] &&
      [[ "$PREBUFFER" == "" ]]
    then
      zcom::predict
    else
      zle -M ""
    fi
  fi
  zcom::highlight
}

function zcom::backward-delete-char
{
  ((CURSOR--))
  BUFFER="$LBUFFER"

  # if [[ "$LBUFFER" != "" ]]; then
    # ((CURSOR--))
    # BUFFER="$LBUFFER"
    # if [[ "$LBUFFER" != "" ]] && [[ "$LBUFFER[-1]" != " " ]]; then
      # zcom::predict
    # else
      # zle -M ""
    # fi
    # zcom::highlight
  # fi
}

function zcom::complete-word()
{
  comppostfuncs=( zcom::limit-list )
  zle complete-word
  return $?
}

function zcom::expand-or-complete
{
  if [[ "$RBUFFER" == "" ]]; then
    zle .expand-or-complete
  else
    BUFFER="$LBUFFER"
    zcom::complete-word
    if [[ "$LBUFFER[-2,-1]" == '\ ' ]] ||
       [[ "$LBUFFER[-1]" != " " ]]
    then
      zcom::complete-word
    fi
  fi
}

zcom::complete-on
