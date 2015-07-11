

alias svndiff='svn diff -r HEAD --diff-cmd "colordiff" -x "-y --suppress-common-lines"'
alias v='/usr/bin/vim'
#   __ _(_) |_
#  / _` | | __|
# | (_| | | |_
#  \__, |_|\__|
#  |___/

alias g='git'
alias gi='git ignore'				# from `brew git-extras`
alias ga='git add'
alias gca='git commit -a -m'
alias gd='git diff --color-words'
alias s='git status'
alias gitlog="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias hotfix-start='git flow hotfix start'	# from `brew git-flow`
alias hotfix-close='git flow hotfix finish -m "hotfix-commit"'
alias feature-start='git flow feature start'	# from `brew git-flow`
alias feature-close='git flow feature finish'
alias release-start='git flow release start'	# from `brew git-flow`
alias release-close='git flow release finish -m "release-commit"'
alias fastfix="gca 'some fixes' && git push"
#  _ __  _ __  _ __ ___
# | '_ \| '_ \| '_ ` _ \
# | | | | |_) | | | | | |
# |_| |_| .__/|_| |_| |_|
#       |_|

alias nmajor='npm version major'
alias nminor='npm version minor'
alias npatch='npm version patch'
alias npublish='git checkout master && npm publish . && git checkout development'
alias ll='ls -lG'

alias mk='make -f makefile.mk'
