srcdir=`dirname $0`
srcdir=`cd $srcdir; pwd`

source "${srcdir}/messages.sh"

if [[ -s "${srcdir}/exports.sh" ]]; then
    source "${srcdir}/exports.sh"
fi

if [[ -s "${srcdir}/path.sh" ]]; then
  source "${srcdir}/path.sh"
fi

if [[ -s "${srcdir}/aliases.sh" ]]; then
  source "${srcdir}/aliases.sh"
fi

if [[ -s "${srcdir}/functions.sh" ]]; then
  source "${srcdir}/functions.sh"
fi

if [[ -s "${srcdir}/github.sh" ]]; then
    source "${srcdir}/github.sh"
fi

# Setup common vi keybindings
bindkey -v

# This makes cd=pushd
setopt AUTO_PUSHD

# Who doesn't want home and end to work?
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line
