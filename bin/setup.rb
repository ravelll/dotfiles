#!/usr/bin/env ruby

unless test("x", "/usr/local/bin/brew")
  system "/usr/bin/env ruby -e \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\""
end

system "brew cask install java" unless test("d", "/usr/local/Caskroom/java")
system "brew bundle"

if test("x", `$(brew --prefix)/Cellar/git/*/share/git-core/contrib/diff-highlight/diff-highlight`)
  system "cp $(brew --prefix)/Cellar/git/*/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin"
end

if test("x", "/usr/local/bin/ghq")
  system "export GHQ_ROOT=\"$HOME/src\""
  system "ghq get https://github.com/ravelll/dotfiles.git"

  dotfiles_path = "~/src/github.com/ravelll/dotfiles"
  `ls -A #{dotfiles_path}`.split("\n").keep_if{|f|f[0] == "."}.each do |dotfile|
    system "ln -svf #{dotfiles_path}/#{dotfile} ~"
  end
end

unless test("d", "~/.vim/repos/github.com/Shougo/dein.vim")
  system "curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh"
  system "sh ./installer.sh ~/.vim/"
  # TODO: install plugins
  # TODO: copy colorschema
end

system "git clone https://github.com/riywo/anyenv ~/.anyenv && exec $SHELL -l" unless test("x", "~/.anyenv/bin/anyenv")
system "anyenv install rbenv" unless test("d", "~/.anyenv/envs/rbenv")
system "anyenv install phpenv" unless test("d", "~/.anyenv/envs/phpenv")
system "anyenv install pyenv" unless test("d", "~/.anyenv/envs/pyenv")

unless test("x", "~/.nodebrew/current/bin/nodebrew")
  system "curl -L git.io/nodebrew | perl - setup"
  system "source ~/.zshrc && nodebrew install-binary latest"
end
