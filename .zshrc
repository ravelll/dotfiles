#
# PATH
#
if [ -z $TMUX ]; then
  # Comment out the same lines with below in /etc/zprofile,
  # when you use this .zshrc on the new machine.
  if [ -x /usr/libexec/path_helper ]; then
    eval `/usr/libexec/path_helper -s`
  fi

  export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$HOME/.local/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin/:/opt/X11/bin:$HOME/bin:$HOME/.anyenv/bin:$HOME/dev/bin:$HOME/.cargo/bin:$HOME/.cargo/env:$PATH"
fi

export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
export HOMEBREW_REPOSITORY="/opt/homebrew"
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:"
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}"

## completion
fpath=($HOMEBREW_PREFIX/share/zsh/functions $HOMEBREW_PREFIX/share/zsh/site-functions $fpath)
autoload -Uz compinit

if [[ -n ${HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' group-name ''
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path ~/.zsh/cache

### history
HISTFILE=$HOME/.zsh_history
HISTSIZE=530000
SAVEHIST=530000
case $HIST_STAMPS in
  "mm/dd/yyyy") alias history='fc -fl 1' ;;
  "dd.mm.yyyy") alias history='fc -El 1' ;;
  "yyyy-mm-dd") alias history='fc -il 1' ;;
  *) alias history='fc -l 1' ;;
esac

setopt auto_cd
setopt multios
setopt prompt_subst
setopt append_history
setopt extended_history
setopt hist_find_no_dups
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

if [ -f $HOMEBREW_PREFIX/opt/spaceship/spaceship.zsh ]; then
  source $HOMEBREW_PREFIX/opt/spaceship/spaceship.zsh
  SPACESHIP_TIME_COLOR=101
  SPACESHIP_TIME_SHOW=true
  SPACESHIP_DIR_TRUNC_REPO=false
  SPACESHIP_GIT_BRANCH_COLOR=77
  SPACESHIP_GIT_STATUS_COLOR=122
else
  ### prompt format
  autoload -Uz vcs_info
  zstyle ':vcs_info:*' formats '[%b]'
  zstyle ':vcs_info:*' actionformats '[%b|%a]'
  precmd () {
    psvar=()
    LANG=en_US.js_JP.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
  }

  #### show / unshow branch name by on git repos, or not
  PROMPT="%F{magenta}%D{%T}%f %F{cyan}%/%f %1(v|%F{green}%1v%f|)
$ "
fi

typeset -U path cdpath fpath manpath

## zsh options
setopt mark_dirs
setopt no_beep
setopt correct
setopt list_packed
setopt no_global_rcs

# Load local environment
if [ -f ~/.localenv ]; then
  source ~/.localenv
fi

#
# programming language environment
#
# anyenv
if [ -z $TMUX ]; then
  eval "$(anyenv init - --no-rehash)"
fi

## go
export GOPATH="$HOME/dev"

## perl
export PERL_CPANM_OPT="--local-lib=$HOME/.perl-extlib"
export PERL5LIB="$HOME/.perl-extlib/lib/perl5:$PERL5LIB"

### aliases
alias be='bundle exec'
alias ber='bundle exec ruby'
alias bi='bundle install'

#
# other tools environment
#
## direnv
eval "$(direnv hook zsh)"

## git
compdef g='git'
alias g='git'
alias gg='git grep'
alias gd='git diff --relative'
alias gst='git status'
alias cm='git switch master'
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}
alias ggpu='git pull origin $(current_branch) --ff-only'
alias ggpush='git push origin $(current_branch)'

## ssh
alias ssh='TERM=xterm ssh'

## vim
EDITOR="vim"
alias v='env LANG=ja_JP.UTF-8 vim "$@"'

## pt
alias pt='pt -i --hidden'

## ripgrep
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
alias rp='rg --hidden'

## z
[ -f $HOMEBREW_PREFIX/etc/profile.d/z.sh ] && . $HOMEBREW_PREFIX/etc/profile.d/z.sh

## tmux
alias t='tmux -2 -u -l'

## GHQ
export GHQ_ROOT="$HOME/dev/src"
alias qg='ghq get'
function ghq-new() {
  local root=`ghq root`
  local user=`git config --get github.user`
  if [ -z "$user" ]; then
    echo "you need to set github.user."
    echo "git config --global github.user YOUR_GITHUB_USER_NAME"
    return 1
  fi
  local name=$1
  local repo="$root/github.com/$user/$name"
  if [ -e "$repo" ]; then
    echo "$repo is already exists."
    return 1
  fi
  git init $repo
  cd $repo
}
alias qn='ghq-new'

## peco
if [ -f ~/.zsh/peco.zsh ]; then
  source ~/.zsh/peco.zsh
  bindkey '^jb' peco_git_recent_branches
  bindkey '^jB' peco_git_recent_all_branches
  bindkey '^jT' peco_git_tags
  bindkey '^jl' peco_git_hashes
  bindkey '^jz' peco_cd_history
  bindkey '^jd' peco_insert_history
  bindkey '^R'  peco_select_history
  bindkey '^js' peco_select_ghq
fi

## docker
alias d='docker'
alias dc='docker-compose'

## other aliases
alias ls='lsd'
alias sl='ls'
alias ll='ls -alF'
alias ps='ps aux'
alias man='env LANG=C man'
alias tags='rm tags > /dev/null 2>&1; ctags -R > /dev/null 2>&1'
alias size='du -h -d 1'
alias -g ...='cd ../../'
alias -g ....='cd ../../../'
alias -- -='cd -'
alias -g P='| peco'
alias notify='terminal-notifier -title "" -subtitle "" -message ""'
alias pe="pet exec"
alias pr="hub browse -- pull/$(git symbolic-ref --short HEAD)"
