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
# Productivity
##########################

brew cask install alfred # remember to install the additional pack
brew cask install tg-pro # for fan control
brew cask install cleanmymac
brew cask install flux
brew cask install tripmode  # Wifi usage while commuting
brew cask install slate
brew cask install karabiner
brew cask install citrix-receiver
brew cask install slack
brew cask install dash # Licensed version: 2.2.6
brew cask install google-chrome
brew cask install cakebrew
brew cask install osxfuse

##########################
# Fonts
##########################
brew cask install \
     font-fira-code \
     font-fira-mono \
     font-fira-mono-for-powerline \
     font-fira-sans

# Other, not on cask
# - cobook
# - 1keyboard
# - growl



##########################
# Docker Linux VM
##########################

brew install virtualbox
brew cask install dockertoolbox
brew install ansible
brew install virt

##########################
# Haskell related packages
##########################

brew install haskell-stack # should be everything we need..

# brew install ghc
# brew install cabal-install

##########################
# Core Utils
##########################

brew install coreutils
brew install dos2unix
brew install ssh-copy-id
brew install homebrew/dupes/make # Gmake 4.1 !
brew install gnutls
brew install binutils


##########################
# Dev utils
##########################

brew install git
brew install git-extras
brew install protobuf
brew install protobuf-c
brew install hub
brew install jq
brew install watchman
brew install clang-format
brew install httpie # `http` command

##########################
# Other languages
##########################

brew install idris
brew install homebrew/science/octave
brew install homebrew/science/r


##########################
# Shell tools
##########################

brew install ack
brew install tree
brew install tmux
brew install z
brew install the_silver_searcher
brew install zsh

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
brew install stow

brew install ledger
brew install lftp

brew install osxfuse
brew install homebrew/fuse/sshfs

brew install pdf2svg
brew install svg2pdf
brew install xpdf ## pdftops
brew install pstree
brew install reattach-to-user-namespace # tmux copy and paste
brew install shellcheck
brew install aha ## HTML from colored output

brew install trash
brew install ffmpeg
brew install gifsicle


##########################
# Graphics/Diagrams
##########################

brew install ghostscript
brew install imagemagick --with-webp
brew install plantuml
brew install graphviz
brew install ditaa

##########################
# Photography
##########################

brew cask install google-nik-collection
brew cask install intensify-pro
brew cask install snapheal-pro
brew cask install adobe-photoshop-lightroom


##########################
# Editing, conversion etc..
##########################

brew install pandoc
brew install pandoc-citeproc
brew install asciidoc
brew install aspell --with-lang-it --with-lang-en
brew install ispell
brew install bibtex2html
brew install emacs
brew install languagetool

#######################
# Mail in Emacs
#######################

brew install mu --with-emacs 
brew install offlineimap

######################
# Other brew assimilated packages
######################

# For latexindent (emacs beautification of latex)
# Blah!
sudo cpan App::cpanminus
sudo cpanm YAML::Tiny
sudo perl -MCPAN -e 'install "File::HomeDir"'


# Remove outdated versions from the cellar.
brew cleanup
