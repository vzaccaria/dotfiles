#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

brew install brew-cask

##########################
# Docker Linux VM
##########################

brew install virtualbox
brew cask install dockertoolbox

##########################
# Haskell related packages
##########################

brew install ghc
brew install cabal-install
brew install haskell-stack

##########################
# Core Utils
##########################

brew install coreutils
brew install dos2unix
brew install ssh-copy-id

##########################
# Dev utils
##########################

brew install git
brew install git-extras
brew install protobuf
brew install protobuf-c
brew install r
brew install pandoc
brew install pandoc-citeproc

##########################
# Shell tools
##########################

brew install ack
brew install tree
brew install tmux
brew install z
brew install the_silver_searcher

##########################
# Misc tools
##########################

# Install `wget` with IRI support.
brew install wget --with-iri

brew install vim --override-system-vi
brew install nmap
brew install lynx
brew install rename

brew install gnu-sed
brew install gnu-tar

##########################
# Graphics/Diagrams
##########################

brew install imagemagick --with-webp
brew install plantuml
brew install graphviz

# Remove outdated versions from the cellar.
brew cleanup
