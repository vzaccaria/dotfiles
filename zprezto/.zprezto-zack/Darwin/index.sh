

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


# I dont remember why this is here..
unsetopt correct_all

 

# | |__ | |__   ___  _ __ ___ | |__
# | '_ \| '_ \ / _ \| '_ ` _ \| '_ \
# | | | | |_) | (_) | | | | | | |_) |
# |_| |_|_.__/ \___/|_| |_| |_|_.__/


if [[ "$myhost" == "hbomb" ]]; then


      # See https://blog.breadncup.com/2011/06/09/skip-git-ssl-verification/
      export GIT_SSL_NO_VERIFY=1

      #              _   _
      #  _ __   __ _| |_| |__
      # | '_ \ / _` | __| '_ \
      # | |_) | (_| | |_| | | |
      # | .__/ \__,_|\__|_| |_|
      # |_|

      path=(\
	 /home/zaccaria/usr/local/bin \
         /usr/local/sbin \
         /usr/local/bin \
         /usr/sbin \
         /usr/bin \
         /sbin \
         /bin \
	      /home/zaccaria/node_modules/.bin \
         /home/zaccaria/bin)

      #                             _
      #   _____  ___ __   ___  _ __| |_ ___
      #  / _ \ \/ / '_ \ / _ \| '__| __/ __|
      # |  __/>  <| |_) | (_) | |  | |_\__ \
      #  \___/_/\_\ .__/ \___/|_|   \__|___/
      #           |_|

      export TERM=linux
      export LC_ALL=en_US.UTF-8
      export LANG=en_US.UTF-8
      export LANGUAGE=en_US.UTF-8
      export DEFAULT_CHARSET=UTF-8
      export CMAKE_ROOT=/home/zaccaria/usr/local/

      # Setting up python brew: https://github.com/utahta/pythonbrew
      [[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc"


      alias ack='/home/zaccaria/bin/ack'
fi







