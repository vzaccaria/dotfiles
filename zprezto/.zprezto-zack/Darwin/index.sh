srcdir=`dirname $0`
srcdir=`cd $srcdir; pwd`
echo "Setting up Darwin specific config"
echo ""

echo "exports"
if [[ -s "${srcdir}/exports.sh" ]]; then
  source "${srcdir}/exports.sh"
fi
echo_ok


echo "aliases"
if [[ -s "${srcdir}/aliases.sh" ]]; then
  source "${srcdir}/aliases.sh"
fi
echo_ok

echo "functions"
if [[ -s "${srcdir}/functions.sh" ]]; then
  source "${srcdir}/functions.sh"
fi
echo_ok

#echo " * setting up local python environment in ~/local-python"
#source ~/local-python/bin/activate

# if [[ -s "${srcdir}/docker.sh" ]]; then
#   source "${srcdir}/docker.sh"
# fi
# 
# echo "libvirt"
# if [[ -s "${srcdir}/libvirt.sh" ]]; then
#   source "${srcdir}/libvirt.sh"
# fi
# echo_ok
# 
# echo "qnap utils"
# if [[ -s "${srcdir}/qnap-utils.sh" ]]; then
#     source "${srcdir}/qnap-utils.sh"
# fi
# echo_ok

# echo ""
# echo "Done."
# bat --decorations never --paging never ${srcdir}/tips.md


# I dont remember why this is here..
unsetopt correct_all
