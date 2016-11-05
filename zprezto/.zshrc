#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

fpath=(/usr/local/share/zsh/site-functions $fpath)

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Source my configuration.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto-zack/common.zshrc" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto-zack/common.zshrc"
fi

