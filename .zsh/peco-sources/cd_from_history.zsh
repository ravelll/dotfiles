# {{{
setopt hist_ignore_all_dups

# cd history file
typeset -U chpwd_functions
CD_HISTORY_FILE=${HOME}/.cd_history_file

function chpwd_record_history() {
  echo $PWD >> ${CD_HISTORY_FILE}
}
chpwd_functions=($chpwd_functions chpwd_record_history)

# choose directory from history
function peco_get_destination_from_history() {
  sort ${CD_HISTORY_FILE} | uniq -c | sort -r | \
    sed -e 's/^[ ]*[0-9]*[ ]*//' | \
    sed -e s"/^${HOME//\//\\/}/~/" | \
    peco | xargs echo
}

# cd from history
function peco_cd_history() {
  local destination=$(peco_get_destination_from_history)
  [ -n $destination ] && cd ${destination/#\~/${HOME}}
  zle reset-prompt
}
zle -N peco_cd_history

# insert directory name to buffer from cd history
function peco_insert_history() {
  local destination=$(peco_get_destination_from_history)
  if [ $? -eq 0 ]; then
    local new_left="${LBUFFER} ${destination} "
    BUFFER=${new_left}${RBUFFER}
    CURSOR=${#new_left}
  fi
  zle reset-prompt
}
zle -N peco_insert_history
# }}}
