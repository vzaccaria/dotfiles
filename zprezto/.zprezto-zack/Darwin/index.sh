srcdir=`dirname $0`
srcdir=`cd $srcdir; pwd`
echo "Setting up Darwin specific config"
echo ""
echo " * exports"
if [[ -s "${srcdir}/exports.sh" ]]; then
  source "${srcdir}/exports.sh"
fi

echo " * paths "
if [[ -s "${srcdir}/path.sh" ]]; then
  source "${srcdir}/path.sh"
fi

echo " * aliases"
if [[ -s "${srcdir}/aliases.sh" ]]; then
  source "${srcdir}/aliases.sh"
fi

echo " * functions"
if [[ -s "${srcdir}/functions.sh" ]]; then
  source "${srcdir}/functions.sh"
fi

echo "Done."


# I dont remember why this is here..
unsetopt correct_all
