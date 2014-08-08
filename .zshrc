#
# oh-my-zsh
# (put top to overwrite ohmyzsh aliases)
#
export ZSH=$HOME/.oh-my-zsh
plugins=(git)
source $ZSH/oh-my-zsh.sh


#
# PATH
#
export PATH="/usr/local/heroku/bin:/Users/taniguchi/.rbenv/versions/2.1.1/bin:/Users/t308/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/heroku/bin:/Users/taniguchi/.rbenv/versions/2.1.1/bin:/Users/t308/.rbenv/shims"

#
# programming language environment
#
## nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

## go
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"

## perl
export PERL_CPANM_OPT="--local-lib=$HOME/.perl-extlib"
export PERL5LIB="$HOME/.perl-extlib/lib/perl5:$PERL5LIB"

## ruby
### gem
GEM_HOME="/Users/taniguchi/.rbenv/versions/2.1.1/lib/ruby/gems/2.1.0"
PATH="/Users/taniguchi/.rbenv/versions/2.1.1/bin:$PATH"

### rbenv
path=($HOME/.rbenv/bin(N) $path)
eval "$(rbenv init -)"

### aliases
alias rb='ruby'
alias be='bundle exec'
alias rs='bundle exec rspec spec'

## java
### aliases
alias javac='javac -J-Dfile.encoding=UTF-8'
alias java='java -Dfile.encoding=UTF-8'


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
EDITOR="/Applications/MacVim.app/Contents/MacOS/Vim -c \"set fenc=utf-8\""
export VIMRUNTIME=/Applications/MacVim.app/Contents/Resources/vim/runtime/
alias v='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vi='v'
alias vim='v'

## Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

## z
. `brew --prefix`/etc/profile.d/z.sh

## tmux
alias t='tmux -u'

## peco
source ~/.zsh/peco.zsh
bindkey '^jr' peco_select_rake_task
bindkey '^jb' peco-git-recent-branches
bindkey '^jB' peco-git-recent-all-branches
bindkey '^jz' peco_cd_history
bindkey '^jd' peco_insert_history
bindkey '^R'  peco_select_history
bindkey '^js' peco_select_spec_file

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


#
# other command aliases
#
alias ls='ls -G'
alias ll='ls -alFG'
alias irr='cat ~/Dropbox/memo/irritation.md'
alias virr='vi ~/Dropbox/memo/irritation.md'
