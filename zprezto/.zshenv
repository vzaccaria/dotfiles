#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

machine=`uname`

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto-zack/${machine}/path.sh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto-zack/${machine}/path.sh"
fi

host=`hostname`

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto-zack/${machine}/${host}/path.sh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto-zack/${machine}/${host}/path.sh"
fi

export HISTSIZE=1000
source "$HOME/.cargo/env"
