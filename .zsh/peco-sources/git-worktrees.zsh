function peco_select_git_worktree() {
  local repo_root
  local common_git_dir
  common_git_dir=$(git rev-parse --git-common-dir 2>/dev/null)
  if [ -n "$common_git_dir" ]; then
    common_git_dir=$(cd "$common_git_dir" 2>/dev/null && pwd -P)
    repo_root=$(cd "$common_git_dir/.." 2>/dev/null && pwd -P)
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
