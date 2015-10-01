srcdir=`dirname $0`
srcdir=`cd $srcdir; pwd`

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


# Setup common vi keybindings
bindkey -v
