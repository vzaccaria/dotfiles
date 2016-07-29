# Shoiirtcuts
alias t="tree -d -L 3"
alias d="cd ~/Dropbox"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias p="cd ~/projects"
alias dg='cd ~/development/github'
alias h='/usr/local/bin/hub'
alias ric='cd "/Users/zaccaria/Dropbox/Commuting/Ricercatore TI 2011"'

# JavaScriptCore REPL
jscbin="/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc";
[ -e "${jscbin}" ] && alias jsc="${jscbin}";
unset jscbin;

# Trim new lines and copy to clipboard
alias c="tr -d '\n' | pbcopy"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine. https://mths.be/bum
alias trash-empty-it="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias desktop-hide-icons="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias desktop-show-icons="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Disable Spotlight
alias spotlight-off="sudo mdutil -a -i off"
# Enable Spotlight
alias spotligh-on="sudo mdutil -a -i on"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

alias cwd='pwd | pbcopy'
alias mi='open -a "Mou"'
alias sv='open -a "Google Chrome"'

alias mine='sudo chown -R zaccaria '

alias shellinit-open='cd /Users/zaccaria/dotfiles/zprezto/.zprezto-zack'


alias tree='tree -CAFa -I "CVS|*.*.package|.svn|.git|.hg|node_modules|bower_components" --dirsfirst'

alias start-python="source ~/python-scripts/bin/activate"

alias battery-percentage="pmset -g batt | egrep \"([0-9]+\%).*\" -o --colour=auto | cut -f1 -d';'"

alias battery-time-left="pmset -g batt | egrep \"([0-9]+\%).*\" -o --colour=auto | cut -f3 -d';'"

alias no-sleep-for-one-hour="caffeinate -u -t 3600"

alias make='gmake'

