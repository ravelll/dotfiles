setopt hist_ignore_all_dups

function peco_select_ghq() {
  local selected_dir=$(ghq list | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd $GHQ_ROOT/${selected_dir}"
    zle accept-line
  fi
}
zle -N peco_select_ghq
