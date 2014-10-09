function vagrant_with_direnv() {
    if [ -f $3/.envrc ]; then
      source $3/.envrc
    fi
    vagrant $1 $2
}

function vagrant_peco_ssh() {
  local arg
  arg=$(vagrant-global-status \
  | peco \
  | awk 'NR == 1 {print "ssh",$1,$5}')
  vagrant_with_direnv $arg
}

function vagrant_peco_command() {
  export -f vagrant_with_direnv
  vagrant-global-status \
  | peco \
  | awk -v cmd="$1" '{print cmd,$1,$5}' \
  | xargs -I % bash -c "vagrant_with_direnv %"
}

function vagrant_peco() {
  if [ $# -ge 1 ] ; then
    if [ $1 = "ssh" ]; then
      vagrant_peco_ssh "$*"
    else
      vagrant_peco_command "$*"
    fi
  else
    echo "Usage: vagrant-peco <command>"
  fi
}
zle -N vagrant_peco


