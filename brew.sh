#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Install kitty
brew install --cask kitty

# CLI Improved tools
brew install eza # Better ls
brew install bat # Better cat
brew install tree
brew install dust # Better du

# Install tmux to manage terminal sessions
brew install tmux

# Install thefuck to fix command errors
brew install thefuck

# Install Docker
brew install docker

# Instal Node version manager
brew install nvm
# You should create NVM's working directory if it doesn't exist:
mkdir ~/.nvm

# Add the following to your shell profile e.g. ~/.profile or ~/.zshrc:
export NVM_DIR="$HOME/.nvm"
[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"                                       # This loads nvm
[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# Install neovim and LazyVim Dependencies
brew install neovim
brew install rust-analyzer
brew install grep
brew install fish
brew install —cask julia
brew install php
brew install ast-grep
brew install python
brew install go
brew install rust
brew install lua
brew install lazygit
brew install lazydocker
# Needed for Obsidian.nvim
brew install pngpaste

brew install fzf
brew install openssh
brew install screen

# Install git
brew install git

# Install github cli
brew install gh

# MacOS Tool bar
brew install --cask hot
brew install --cask rectangle
brew install --cask amazon-q

# Oh my zsh
brew install powerlevel10k
echo "source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc

# Remove outdated versions from the cellar.
brew cleanup
