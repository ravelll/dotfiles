## zsh
### oh-my-zsh
ZSH=$HOME/.oh-my-zsh
plugins=(git)
source $ZSH/oh-my-zsh.sh

### git-completion
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
autoload -U compinit
compinit -u

### history
histfile=$home/.zsh_history
histsize=1000000
savehist=1000000
setopt share_history

### zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

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

# Load local environment
source ~/.localenv

#
# PATH
#
export PATH="/usr/local/bin:/usr/bin:/usr/sbin:/bin:/sbin/:opt/X11/bin:$DOTPATH/bin:$PATH"

#
# programming language environment
#
# anyenv
export PATH="$PATH:$HOME/.anyenv/bin"
eval "$(anyenv init -)"

## javascript
### nodebrew
export PATH="$PATH:$HOME/.nodebrew/current/bin"

## go
export GOPATH="$HOME"
export PATH="$PATH:$GOPATH/bin"
alias gotags='gotags -R ./* >> tags'

## perl
export PERL_CPANM_OPT="--local-lib=$HOME/.perl-extlib"
export PERL5LIB="$HOME/.perl-extlib/lib/perl5:$PERL5LIB"

### aliases
alias be='bundle exec'
alias ber='bundle exec ruby'
alias bi='bundle install --path vendor/bundle'

## Qt
export PATH="$PATH:/usr/local/Cellar/qt5/5.4.0/bin/"

#
# other tools environment
#
## homebrew
alias cask='brew cask'

## php-cs-fixer
alias pf='./vendor/bin/php-cs-fixer fix "$@" --config-file=.php_cs'

## git
alias g='git'
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
EDITOR="vim -c \"set fenc=utf-8\""
VIMRUNTIME=/usr/local/Cellar/vim/*(/)/share/vim/*(/)/
alias v='env LANG=ja_JP.UTF-8 vim "$@"'

## pt
alias pt='pt -i'

## Heroku Toolbelt
export PATH="$PATH:/usr/local/heroku/bin"

## z
. `brew --prefix`/etc/profile.d/z.sh

## s
if [ -f $GOPATH/src/github.com/zquestz/s/autocomplete/s-completion.bash ]; then
  . $GOPATH/src/github.com/zquestz/s/autocomplete/s-completion.bash
fi

## tmux
alias t='tmux -2 -u -l'

## GHQ
export GHQ_ROOT="$HOME/src"
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

## other aliases
alias ls='ls -G'
alias sl='ls'
alias ll='ls -alFG'
alias ms='massren'
alias ps='ps aux'
alias man='env LANG=C man'
alias tags='rm tags > /dev/null 2>&1; ctags -R'
