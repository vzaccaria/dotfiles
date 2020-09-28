#!/bin/bash
# GitHub aliases
# Commented because it (probably) conflicts with zsh autocompletion
# -- eval "$(/usr/local/bin/hub alias -s)"

# Zed magic cd
# from here: https://github.com/rupa/z
. /usr/local/etc/profile.d/z.sh

,tower-this() {
    /Applications/Tower.app/Contents/MacOS/gittower "$(git rev-parse --show-toplevel)"
}

ntmuxz() {
        directory=$(grealpath "$1" | tr -d '\n\')
        shellcomm="${@:2}"
        command="tmux new-session -c $directory zsh --interactive -c '$shellcomm'"
        ecommand=$(echo $command | jq -sRr @uri)
        echo "http://localhost:3005/?arg=-c&arg=($ecommand)"  | pbcopy
}

ntmuxc() {
        directory=$(grealpath "$1" | tr -d '\n\')
        shellcomm="${@:2}"
        command="tmux new-session -c $directory $shellcomm"
        ecommand=$(echo $command | jq -sRr @uri)
        echo "http://localhost:3005/?arg=-c&arg=($ecommand)"  | pbcopy
}

nemacs() {
        currentdir=$(pwd)
        file=$(grealpath "$1" | tr -d '\n\')
        command="/usr/local/bin/emacsclient -nw "$file" -c"
        ntmuxc $currentdir $command
}

nvi() {
        currentdir=$(pwd)
        file=$(grealpath "$1" | tr -d '\n\')
        command="nvim $file"
        ntmuxc $currentdir $command
}

ntmux-session() {
        ntmuxc $1 ""
}


ntmux() {
        ntmuxc $1 ""
}


,path-real() {
  grealpath "$1" | tr -d '\n' | pbcopy
}

alias rp=',path-real'

# Change working directory to the top-most Finder window location
,cd-to-finder() { # short for `cdfinder`
  cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')" || exit
}



# `o` with no arguments opens the current directory, otherwise opens the given
# location
o() {
  if [ $# -eq 0 ]; then
    open .;
  else
    open "$@";
  fi;
}


setUsDictionary() {
    defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
    defaults write -g NSSpellCheckerAutomaticallyIdentifiesLanguages -bool false
    defaults write "Apple Global Domain" NSPreferredSpellServerLanguage en_US
    killall OpenSpell
    echo "Dictionary -> EN_US (toggle 'Edit > Check spelling while typing' to enable document check)"
    echo "You might need to reopen the app."
}

setItDictionary() {
    defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
    defaults write -g NSSpellCheckerAutomaticallyIdentifiesLanguages -bool false
    defaults write "Apple Global Domain" NSPreferredSpellServerLanguage it
    killall OpenSpell
    echo "Dictionary -> IT (toggle 'Edit > Check spelling while typing' to enable document check)"
    echo "You might need to reopen the app."
}

getCurrentSpellDictionary() {
    echo "Current dictionary: "
    defaults read -g NSPreferredSpellServerLanguage
}

killAdobeProcesses() {
    launchctl list | grep -o '\S*adobe\S*' | while read -r x; do launchctl remove "$x"; done
    echo 'removing adobe processes...'
    echo ' '
    echo 'To remove completely:'
    echo '> rm /Library/LaunchAgents/*adobe*'
    echo '> rm ~/Library/LaunchAgents/*adobe*'
}


manmd() {
    pandoc -s -f markdown+all_symbols_escapable -t man "$@" | sed 's/\[C\]/\[B\]/g' | groff -T utf8 -man | less 
}

alias emacsclient=/usr/local/bin/emacsclient
alias vi='NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvim'

resetemacs() {
    rm -rf /Users/zaccaria/.emacs.d/elpa
    startemacs
    stopemacs
    echo "As per: https://github.com/syl20bnr/spacemacs/issues/3314 you should now:"
    echo "1. remove org and org-plus-contrib"
    echo "2. restartemacs"
}

mov2gif() {
    if [ -z "$1" ]; then
        echo "Open Quicktime Player"
        echo "Go to File -> New Screen Recording"
        echo "Go to File -> Export -> As Movie"
        echo "Then launch this script with the name of that file"
    else
        input=$(basename "$1" .mov)
        rm -f "$input.gif"
        ffmpeg -i "$1" -s 600x400 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > "$input.gif"
    fi
}


,mail-compose-html() {
    touch ~/temp.md
    nvim ~/temp.md 
    pandoc ~/temp.md | pbcopy
}

,edit-and-copy-html() {
    finput=`grealpath "$1"`
    emacsclient -nw ${finput} -c
    pandoc ${finput} | pbcopy
}

,mail-compose() {
    pbpaste | sed 's/^/> /' > ~/temp.md
    vi ~/temp.md 
    cat ~/temp.md | pbcopy
}


,attach-id-scan() {
    # link docs to ids.pdf
    pfx=$(basename "$1" .pdf)
    pdftk $1 ~/ids.pdf cat output $pfx.signed.pdf
    open $pfx.signed.pdf -a "Preview"
}

kp() {

## PROCESS
# mnemonic: [K]ill [P]rocess
# show output of "ps -ef", use [tab] to select one or multiple entries
# press [enter] to kill selected processes and go back to the process list.
# or press [escape] to go back to the process list. Press [escape] twice to exit completely.

local pid=$(ps -ef | sed 1d | eval "fzf ${FZF_DEFAULT_OPTS} -m --header='[kill:process]'" | awk '{print $2}')

if [ "x$pid" != "x" ]
then
  echo $pid | xargs kill -${1:-9}
  kp
fi
}

bcp() {
### BREW + FZF
# mnemonic [B]rew [I]nstall [P]lugin

local uninst=$(brew leaves | eval "fzf ${FZF_DEFAULT_OPTS} -m --header='[brew:clean]'")

if [[ $uninst ]]; then
  for prog in $(echo $uninst)
  do brew uninstall $prog
  done
fi
}

bip() {

        ### BREW + FZF
        # update multiple packages at once
        # mnemonic [B]rew [U]pdate [P]lugin

        local inst=$(brew search | eval "fzf ${FZF_DEFAULT_OPTS} -m --header='[brew:install]'")

        if [[ $inst ]]; then
          for prog in $(echo $inst)
          do brew install $prog
          done
        fi
}

# alternative using ripgrep-all (rga) combined with fzf-tmux preview
# implementation below makes use of "open" on macOS, which can be replaced by other commands if needed.
# allows to search in PDFs, E-Books, Office documents, zip, tar.gz, etc. (see https://github.com/phiresky/ripgrep-all)
# find-in-file - usage: fif <searchTerm> or fif "string with spaces" or fif "regex"
fif() {
    if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
    local file
    file="$(rga --max-count=1 --ignore-case --files-with-matches --no-messages "$@" | fzf-tmux +m --preview="rga --ignore-case --pretty --context 10 '"$@"' {}")" && open "$file"
}

fo() {
  local out file key
  IFS=$'\n' out=("$(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)")
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
}

fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  open "$dir"
}

fe() (
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
)


# fda - including hidden directories
fda() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}



keynote2pdf() {
FILE_INPUT=`grealpath "$1"`
FILE_OUTPUT=`echo $FILE_INPUT | sed "s/\.key$/\.pdf/"`
    echo Exporting $FILE_INPUT to pdf
osascript << EOF
      tell application "System Events"
        tell application "Keynote"
          activate
          open POSIX file "${FILE_INPUT}"
          export front document to POSIX file "${FILE_OUTPUT}" as PDF
        end tell
        do shell script "killall Keynote"
      end tell
EOF
}
