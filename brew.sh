#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Casks
brew upgrade brew-cask
brew tap caskroom/cask

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen
brew install homebrew/php/php56 --with-gmp
brew install git

# Command line tools
brew install bfg cmake curl hub tmux the_silver_searcher tree

brew install gcc

# Python
brew install pyenv
brew install pyenv-virtualenv

# Ruby
brew install ruby-build rbenv

# Node, npm
brew install node

# Other languages
brew install hg go scala # Go uses mercurial, not 100% sure hg is necessary but whatevs
brew cask install java julia

# SQL/DBs
# mysql-server mysql-common mysql-client postgresql-9.4 postgresql-contrib-9.4 postgresql-server-dev-9.4 pgadmin3
brew install mongo mysql mysqlworkbench postgresql robomongo # this is kind of busted

# Docker
brew install docker

# Casks
brew install brew-cask
brew upgrade brew-cask
brew tap caskroom/cask

# creature comforts
brew cask install alfred flux spectacle

# Editor
brew cask install atom

# Plumbing
brew cask install openconnect-gui ssh-tunnel-manager

# Work
brew cask install slack tableau

# Remove outdated versions from the cellar.
brew cleanup
