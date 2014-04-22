# PATH
export PATH="/usr/local/bin:$PATH"

alias ssh='TERM=xterm ssh'

# rbenv
path=($HOME/.rbenv/bin(N) $path)
eval "$(rbenv init -)"

# gem
GEM_HOME="/Users/taniguchi/.rbenv/versions/2.1.1/lib/ruby/gems/2.1.0"
PATH="/Users/taniguchi/.rbenv/versions/2.1.1/bin:$PATH"

# tmux
alias tmux='tmux -u'

# vi
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

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
alias d='git diff'
alias dw='git diff --word-diff'
alias cm='git checkout master'

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

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
