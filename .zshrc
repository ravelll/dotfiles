## completion
fpath=($(brew --prefix)/share/zsh-completions $fpath)
fpath=($(brew --prefix)/share/zsh/functions $fpath)
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
autoload -U compinit; compinit -C

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
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

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
PROMPT="%F{cyan}%n ▶ %/%f %1(v|%F{green}%1v%f|)
$ "
typeset -U path cdpath fpath manpath

## zsh options
setopt mark_dirs
setopt no_beep
setopt complete_aliases
setopt correct
setopt list_packed
setopt no_global_rcs

# Load local environment
if [ -f ~/.localenv ]; then
  source ~/.localenv
fi

#
# PATH
#
if [ -z $TMUX ]; then
  export PATH="/usr/local/bin:/usr/bin:/usr/sbin:/bin:/sbin/:/opt/X11/bin:$HOME/bin:$HOME/.anyenv/bin:/usr/local/heroku/bin:$PATH"
fi

#
# programming language environment
#
# anyenv
eval "$(anyenv init - --no-rehash)"

## go
export GOPATH="$HOME/dev"
export PATH="$HOME/dev/bin:$PATH"

## perl
export PERL_CPANM_OPT="--local-lib=$HOME/.perl-extlib"
export PERL5LIB="$HOME/.perl-extlib/lib/perl5:$PERL5LIB"

### aliases
alias be='bundle exec'
alias ber='bundle exec ruby'
alias bi='bundle install --path vendor/bundle'

#
# other tools environment
#
## direnv
eval "$(direnv hook zsh)"

## homebrew
alias cask='brew cask'

## php-cs-fixer
alias pf='./vendor/bin/php-cs-fixer fix "$@" --config-file=.php_cs'
alias vpi='$EDITOR $(php -i | grep "Loaded Configuration File" | cut -d" " -f5)'

## git
alias g='git'
alias gd='git diff'
alias gst='git status'
alias cm='git checkout master'
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}
alias ggpu='git pull origin $(current_branch)'
alias ggpush='git push origin $(current_branch)'

## ssh
alias ssh='TERM=xterm ssh'

## vim
EDITOR="vim"
VIMRUNTIME=/usr/local/Cellar/vim/*(/)/share/vim/*(/)/
alias v='env LANG=ja_JP.UTF-8 vim "$@"'

## pt
alias pt='pt -i'

## z
. `brew --prefix`/etc/profile.d/z.sh

## tmux
alias t='tmux -2 -u -l'

## GHQ
export GHQ_ROOT="$HOME/dev/src"
alias qg='ghq get'

## peco
source ~/.zsh/peco.zsh
bindkey '^jr' peco_select_rake_task
bindkey '^jb' peco_git_recent_branches
bindkey '^jB' peco_git_recent_all_branches
bindkey '^jt' peco_git_tags
bindkey '^jl' peco_git_hashes
bindkey '^jz' peco_cd_history
bindkey '^jd' peco_insert_history
bindkey '^R'  peco_select_history
bindkey '^js' peco_select_ghq
bindkey '^jk' peco_kill
bindkey '^jv' peco_vagrant

## vagrant
alias va='vagrant'
alias vs='vagrant ssh'
alias vst='vagrant status'
alias vh='vagrant halt'
alias vha='vagrant-global-status | cut -d" " -f1 | xargs vagrant halt'
alias vp='vagrant provision'
alias vu='vagrant up'
alias vr='vagrant reload'
alias vd='vagrant destroy'
alias vgs='vagrant-global-status'

## docker
alias d='docker'
alias dc='docker-compose'

## other aliases
alias ls='ls -G'
alias sl='ls'
alias ll='ls -alhFG'
alias ms='massren'
alias ps='ps aux'
alias man='env LANG=C man'
alias tags='rm tags > /dev/null 2>&1; ctags -R > /dev/null 2>&1'
alias size='du -h -d 1'
alias cat='bat'
alias -g ...='cd ../../'
alias -g ....='cd ../../../'
alias -- -='cd -'

if (which zprof > /dev/null) ;then
  zprof | less
fi
