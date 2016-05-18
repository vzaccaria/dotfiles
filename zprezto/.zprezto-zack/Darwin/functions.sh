# GitHub aliases
eval "$(/usr/local/bin/hub alias -s)"

# Zed magic cd
. `brew --prefix`/etc/profile.d/z.sh

vi() {
    emacsclient -nw "$@" -c
}

emacs-gui() {
    emacsclient "$@" -c
}

gvim() {
    emacsclient "$@" -c
}


startemacs() {
    /Users/zaccaria/Applications/Emacs.app/Contents/MacOS/Emacs --daemon
}

stopemacs() {
    emacsclient -e "(kill-emacs)"
}


restartemacs() {
    stopemacs
    sleep 2
    startemacs
}

towerthis() {
    open -a "Tower" .
}

# Use coreutils' grealpath

rp() {
  grealpath $1 | tr -d '\n' | pbcopy
}

islink() {
  grealpath -e "/usr/local/bin/$1"
}

# Change working directory to the top-most Finder window location
function cdf() { # short for `cdfinder`
  cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')";
}

# Start an HTTP server from a directory, optionally specifying the port
function server() {
  local port="${1:-8000}";
  sleep 1 && open "http://localhost:${port}/" &
  # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
  # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
  python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port";
}

# Compare original and gzipped file size
function gz() {
  local origsize=$(wc -c < "$1");
  local gzipsize=$(gzip -c "$1" | wc -c);
  local ratio=$(echo "$gzipsize * 100 / $origsize" | bc -l);
  printf "orig: %d bytes\n" "$origsize";
  printf "gzip: %d bytes (%2.2f%%)\n" "$gzipsize" "$ratio";
}

# `o` with no arguments opens the current directory, otherwise opens the given
# location
function o() {
  if [ $# -eq 0 ]; then
    open .;
  else
    open "$@";
  fi;
}

# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
function tre() {
  tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less -FRNX;
}


#
# generate pdf from org (needs a running emacs daemon)
#
function orgtopdf() {
    echo "emacsclient --eval \"(progn (find-file \\\"`grealpath $1`\\\") (org-latex-export-to-pdf))\""
    emacsclient --eval "(progn (find-file \"`grealpath $1`\") (org-latex-export-to-pdf))"
}

function setUsDictionary() {
    defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
    defaults write -g NSSpellCheckerAutomaticallyIdentifiesLanguages -bool false
    defaults write "Apple Global Domain" NSPreferredSpellServerLanguage en_US
    killall OpenSpell
    echo "Dictionary -> EN_US (toggle 'Edit > Check spelling while typing' to enable document check)"
    echo "You might need to reopen the app."
}

function setItDictionary() {
    defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
    defaults write -g NSSpellCheckerAutomaticallyIdentifiesLanguages -bool false
    defaults write "Apple Global Domain" NSPreferredSpellServerLanguage it
    killall OpenSpell
    echo "Dictionary -> IT (toggle 'Edit > Check spelling while typing' to enable document check)"
    echo "You might need to reopen the app."
}

function getCurrentSpellDictionary() {
    echo "Current dictionary: "
    defaults read -g NSPreferredSpellServerLanguage
}

function killAdobeProcesses() {
    launchctl list | grep -o '\S*adobe\S*' | while read x; do launchctl remove $x; done
    echo 'removing adobe processes...'
    echo ' '
    echo 'To remove completely:'
    echo '> rm /Library/LaunchAgents/*adobe*'
    echo '> rm ~/Library/LaunchAgents/*adobe*'
}
