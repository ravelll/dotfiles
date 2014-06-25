# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
plugins=(git)

source $ZSH/oh-my-zsh.sh

source ~/.zsh/percol.zsh

# bindkeys
bindkey '^jb' percol-git-recent-branches
bindkey '^jB' percol-git-recent-all-branches
bindkey '^jz' percol_cd_history
bindkey '^jf' percol_insert_history

# User configuration

export PATH="/usr/local/heroku/bin:/Users/taniguchi/.rbenv/versions/2.1.1/bin:/Users/t308/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/heroku/bin:/Users/taniguchi/.rbenv/versions/2.1.1/bin:/Users/t308/.rbenv/shims"

# ----------manual setting

# PATH
export PATH="/usr/local/bin:$PATH"

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

alias ssh='TERM=xterm ssh'

# rbenv
path=($HOME/.rbenv/bin(N) $path)
eval "$(rbenv init -)"

# gem
GEM_HOME="/Users/taniguchi/.rbenv/versions/2.1.1/lib/ruby/gems/2.1.0"
PATH="/Users/taniguchi/.rbenv/versions/2.1.1/bin:$PATH"

# gh tools
EDITOR="/Applications/MacVim.app/Contents/MacOS/Vim -c \"set fenc=utf-8\""

# go
export GOPATH="$HOME/dev/golang/"

# vi
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
export VIMRUNTIME=/Applications/MacVim.app/Contents/Resources/vim/runtime/
alias v='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vi='v'
alias vim='v'

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

# perl
export PERL_CPANM_OPT="--local-lib=$HOME/.perl-extlib"
export PERL5LIB="$HOME/.perl-extlib/lib/perl5:$PERL5LIB"

# git-completion
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
autoload -U compinit
compinit -u

# z
. `brew --prefix`/etc/profile.d/z.sh

# command aliases
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
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}
alias ggpu='git pull origin $(current_branch)'
alias ggpush='git push origin $(current_branch)'

alias rs='bundle exec rspec spec'

# history
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt share_history

# VCSの情報を取得するzshの便利関数 vcs_infoを使う
autoload -Uz vcs_info

# 表示フォーマットの指定
# %b ブランチ情報
# %a アクション名(mergeなど)
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

# バージョン管理されているディレクトリにいれば表示，そうでなければ非表示
RPROMPT="%1(v|%F{green}%1v%f|)"
PROMPT='%F{cyan}%n %3d%f % '


## percol
function exists { which $1 &> /dev/null }

if exists percol; then
    function percol_select_history() {
        local tac
        exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
        BUFFER=$(fc -l -n 1 | eval $tac | percol --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh
    }

    zle -N percol_select_history
    bindkey '^R' percol_select_history
fi
