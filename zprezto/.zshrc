#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

source /Users/zaccaria/development/github/shellinit/common.zshrc

# Setup zsh-autosuggestions
#source /Users/zaccaria/.zsh-autosuggestions/autosuggestions.zsh

# Enable autosuggestions automatically
#zle-line-init() {
#zle autosuggest-start
#}

#zle -N zle-line-init

# use ctrl+t to toggle autosuggestions(hopefully this wont be needed as
# zsh-autosuggestions is designed to be unobtrusive)
#bindkey '^T' autosuggest-toggle
