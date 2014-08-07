### use brew installed ctags
alias ssh='TERM=xterm ssh'

### rbenv
if [ -d $HOME/.rbenv/bin ]; then
    export RBENV_ROOT=$HOME/.rbenv
    export PATH="$RBENV_ROOT/bin:$PATH"
    eval "$(rbenv init -)"
fi

### ruby
export PATH="$RBENV_ROOT/shims:$PATH"

### tmux
alias tmux='tmux -u'

### vi
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias v='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vi='v'
alias vim='vi'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

if [ -f /usr/local/etc/bash_completion.d ]; then
  echo 'asdf'
  . /usr/local//etc/bash-completion.d/git-prompt.sh
  . /usr/local/Cellar/bash-completion/1.3/etc/bash-completion.d/git-completion.bash
fi
PS1='\W$(__git_ps1 " (%s)") \$  '

### perl
export PERL_CPANM_OPT="--local-lib=$HOME/.perl-extlib"
export PERL5LIB="$HOME/.perl-extlib/lib/perl5:$PERL5LIB"

### z
. `brew --prefix`/etc/profile.d/z.sh

# go
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"

### command aliases
alias javac='javac -J-Dfile.encoding=UTF-8'
alias java='java -Dfile.encoding=UTF-8'
alias ls='ls -G'
alias ll='ls -alFG'
alias irr='cat ~/Dropbox/memo/irritation.md'
alias virr='vi ~/Dropbox/memo/irritation.md'
alias be='bundle exec'
alias rb='ruby'
alias t='tmux -u'
alias g='git'
alias d='git diff'
alias dw='git diff --word-diff'
alias dn='git diff --name-only'
alias cm='git checkout master'
alias ggpu='git pull origin $(current_branch)'
alias ggpush='git push origin $(current_branch)'
alias rs='bundle exec rspec spec'
