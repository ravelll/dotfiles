function peco_select_git_worktree() {
  local repo_root
  local git_dir
  git_dir=$(git rev-parse --path-format=absolute --git-dir 2>/dev/null)
  if [[ "$git_dir" == */.git/worktrees/* ]]; then
    repo_root="${git_dir%%/.git/worktrees/*}"
  elif [[ "$git_dir" == */.git ]]; then
    repo_root="${git_dir%/.git}"
  fi

  if [ -z "$repo_root" ]; then
    zle -M "not in a git repository"
    return 1
  fi

  local selected_dir
  selected_dir=$(
    find "$repo_root" -mindepth 1 -maxdepth 1 -type d -name 'b_*' -print 2>/dev/null | \
      perl -pe "s{^\Q$repo_root/\E}{}" | \
      sort | \
      peco --query "$LBUFFER"
  )

  if [ -n "$selected_dir" ]; then
    BUFFER="cd $repo_root/$selected_dir"
    zle accept-line
  fi
}
zle -N peco_select_git_worktree
