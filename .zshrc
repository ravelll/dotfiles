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

### zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

### perl
export PERL_CPANM_OPT="--local-lib=$HOME/.perl-extlib"
export PERL5LIB="$HOME/.perl-extlib/lib/perl5:$PERL5LIB"

### z
. `brew --prefix`/etc/profile.d/z.sh

### command aliases
alias javac='javac -J-Dfile.encoding=UTF-8'
alias java='java -Dfile.encoding=UTF-8'
alias ls='ls -G'
alias ll='ls -alFG'
alias dotcp='~/dotcp.sh'
alias -g g='git'
alias irr='cat ~/Dropbox/memo/irritation.md'



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

## show git branch
# autoload -U colors; colors
# 
# function rprompt-git-current-branch {
#         local name st color
# 
#         if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
#                 return
#         fi
#         name=$(basename "`git symbolic-ref HEAD 2> /dev/null`")
#         if [[ -z $name ]]; then
#                 return
#         fi
#         st=`git status 2> /dev/null`
#         if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
#                 color=${fg[green]}
#         elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
#                 color=${fg[yellow]}
#         elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
#                 color=${fg_bold[red]}
#         else
#                 color=${fg[red]}
#         fi
# 
#         # %{...%} は囲まれた文字列がエスケープシーケンスであることを明示する
#         # これをしないと右プロンプトの位置がずれる
#         echo "%{$color%}$name%{$reset_color%} "
# }
# 
# # プロンプトが表示されるたびにプロンプト文字列を評価、置換する
# setopt prompt_subst
# 
# RPROMPT='[`rprompt-git-current-branch`%~]'
PROMPT='%F{green}%n %d%f % '
