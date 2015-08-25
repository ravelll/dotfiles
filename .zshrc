#
# oh-my-zsh
# (put top to overwrite ohmyzsh aliases)
#
ZSH=$HOME/.oh-my-zsh
plugins=(git)
source $ZSH/oh-my-zsh.sh

#
# PATH
#
PATH="/usr/local/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/heroku/bin:/opt/X11/bin:$HOME/.rbenv/shims:$PATH"

#
# programming language environment
#
## nodebrew
PATH=$HOME/.nodebrew/current/bin:$PATH

## go
export GOPATH="$HOME/.go"
export PATH=$PATH:$GOPATH/bin
alias gotags='gotags -R *.go >> tags'

## perl
PERL_CPANM_OPT="--local-lib=$HOME/.perl-extlib"
PERL5LIB="$HOME/.perl-extlib/lib/perl5:$PERL5LIB"
### plenv
export PATH="$HOME/.plenv/bin:$PATH"
eval "$(plenv init -)"

## ruby
### rbenv
path=($HOME/.rbenv/bin(N) $path)
eval "$(rbenv init -)"

### aliases
alias rb='ruby'
alias be='bundle exec'
alias rs='bundle exec rspec spec'
alias bi='bundle install'
alias bip='bundle install --path'
alias rg='rails generate'

## php
PATH="$HOME/.composer/vendor/bin:$PATH"
PATH="$HOME/.phpenv/bin:$PATH"
eval "$(phpenv init -)"

## java
### aliases
alias javac='javac -J-Dfile.encoding=UTF-8'
alias java='java -Dfile.encoding=UTF-8'

## Qt
PATH="/usr/local/Cellar/qt5/5.4.0/bin/:$PATH"

#
# other tools environment
#
## git
alias g='git'
alias d='git diff'
alias dw='git diff --word-diff'
alias dn='git diff --name-only'
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
VIMRUNTIME=/usr/local/Cellar/vim/*(/)/share/vim/vim74/
alias v='env LANG=ja_JP.UTF-8 vim "$@"'

### use MacVim
# EDITOR="/Applications/MacVim.app/Contents/MacOS/Vim -c \"set fenc=utf-8\""
# VIMRUNTIME=/Applications/MacVim.app/Contents/Resources/vim/runtime/
# alias v='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

## Heroku Toolbelt
PATH="/usr/local/heroku/bin:$PATH"

## z
. `brew --prefix`/etc/profile.d/z.sh

## tmux
alias t='tmux -u'

## peco
source ~/.zsh/peco.zsh
bindkey '^jr' peco_select_rake_task
bindkey '^jb' peco_git_recent_branches
bindkey '^jB' peco_git_recent_all_branches
bindkey '^jz' peco_cd_history
bindkey '^jd' peco_insert_history
bindkey '^R'  peco_select_history
bindkey '^js' peco_select_ghq
bindkey '^jk' peco_kill
bindkey '^jv' peco_vagrant

## vagrant
alias vs='vagrant ssh'
alias vh='vagrant halt'
alias vp='vagrant provision'
alias vu='vagrant up'

## other aliases
alias ls='ls -G'
alias sl='ls'
alias ll='ls -alFG'
alias ms='massren'
alias pe='ps -ef'

alias -g P='| peco'
alias -g G='| pt'
alias -g A='| ag'

## zsh
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
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

#### show / unshow branch name by on git repos, or not
RPROMPT="%1(v|%F{green}%1v%f|)"
PROMPT='%F{cyan}%n %3d%f % '
