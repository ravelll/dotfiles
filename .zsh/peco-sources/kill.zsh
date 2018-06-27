function peco_kill() {
  for pid in `\ps aux | peco | awk '{ print $2 }'`
  do
    sudo kill $pid
  done
  zle accept-line
}
zle -N peco_kill
