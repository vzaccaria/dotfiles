

srcdir=`dirname $0`
srcdir=`cd $srcdir; pwd`

echo "Exports"
if [[ -s "${srcdir}/exports.sh" ]]; then
  source "${srcdir}/exports.sh"
fi
echo_ok

echo "Path"
if [[ -s "${srcdir}/path.sh" ]]; then
  source "${srcdir}/path.sh"
fi
echo_ok

echo "Aliases"
if [[ -s "${srcdir}/aliases.sh" ]]; then
  source "${srcdir}/aliases.sh"
fi
echo_ok

echo "Functions"
if [[ -s "${srcdir}/functions.sh" ]]; then
  source "${srcdir}/functions.sh"
fi
echo_ok

if [[ -s "${srcdir}/z.sh" ]]; then
  source "${srcdir}/z.sh"
fi


# I dont remember why this is here..
unsetopt correct_all

 








