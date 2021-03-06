setopt hist_ignore_all_dups

function peco_select_history() {
    BUFFER=$(fc -l -n 1 | tail -r | uniq | peco --query "$LBUFFER")
    CURSOR=$#BUFFER         # move cursor
    zle -R -c               # refresh
}
zle -N peco_select_history
