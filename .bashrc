### use brew installed ctags
alias ctags='/usr/local/bin/ctags'
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
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

. /usr/local/etc/bash_completion.d/git-completion.bash
PS1='\W$(__git_ps1 " (%s)") \$  '

if [ -f `brew --prefix`/usr/local/etc/bash-completion.d ]; then
  . `brew --prefix`/usr/local/etc/bash-completion.d
fi

### perl
export PERL_CPANM_OPT="--local-lib=$HOME/.perl-extlib"
export PERL5LIB="$HOME/.perl-extlib/lib/perl5:$PERL5LIB"

### z
. `brew --prefix`/etc/profile.d/z.sh

### command aliases
alias javac='javac -J-Dfile.encoding=UTF-8'
alias java='java -Dfile.encoding=UTF-8'
alias ll='ls -alFG'
alias dotcp='~/dotcp.sh'
alias g='git'
alias irr='cat ~/Dropbox/memo/irritation.md'
