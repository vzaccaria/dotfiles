

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto-zack/index.sh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto-zack/index.sh"
fi
 
  
machine=`uname`
 
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto-zack/${machine}/index.sh" ]]; then
   source "${ZDOTDIR:-$HOME}/.zprezto-zack/${machine}/index.sh"
fi
 
host=`hostname`
 
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto-zack/${machine}/${host}/index.sh" ]]; then
   source "${ZDOTDIR:-$HOME}/.zprezto-zack/${machine}/${host}/index.sh"
fi


