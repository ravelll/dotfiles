#!/usr/bin/env ruby

system "/usr/bin/env ruby -e \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\""
system "brew cask install java"
system "brew bundle"
system "cp $(brew --prefix)/Cellar/git/*/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin"

system "export GHQ_ROOT=\"$HOME/src\""
system "ghq get git@github.com:ravelll/dotfiles.git"

dotfiles_path = "~/src/github.com/ravelll/dotfiles"
`ls -A #{dotfiles_path}`.split("\n").keep_if{|f|f[0] == "."}.each do |dotfile|
  system "ln -svf #{dotfiles_path}/#{dotfile} ~"
end

system "curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh"
system "sh ./installer.sh ~/.vim/"
# TODO: install plugins
# TODO: copy colorschema

system "git clone https://github.com/riywo/anyenv ~/.anyenv"
system "exec $SHELL -l"
system "anyenv install rbenv"
system "anyenv install phpenv"
system "anyenv install pyenv"

system "curl -L git.io/nodebrew | perl - setup"
system "source ~/.zshrc && nodebrew install-binary latest"
