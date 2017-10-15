#!/bin/bash
# GitHub aliases
# Commented because it (probably) conflicts with zsh autocompletion
# -- eval "$(/usr/local/bin/hub alias -s)"

# Zed magic cd
# from here: https://github.com/rupa/z
. /usr/local/etc/profile.d/z.sh


alias vim=/usr/local/bin/vim


towerthis() {
    /Applications/Tower.app/Contents/MacOS/gittower "$(git rev-parse --show-toplevel)"
}

# Use coreutils' grealpath

rp() {
  grealpath "$1" | tr -d '\n' | pbcopy
}

islink() {
  grealpath -e "/usr/local/bin/$1"
}

# Change working directory to the top-most Finder window location
cdf() { # short for `cdfinder`
  cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')" || exit
}

scopusgetfromeid() {
    open "http://www.scopus.com/record/display.url?eid=$1&origin=resultslist"
}


# Compare original and gzipped file size
gz() {
  origsize=$(wc -c < "$1");
  gzipsize=$(gzip -c "$1" | wc -c);
  ratio=$(echo "$gzipsize * 100 / $origsize" | bc -l);
  printf "orig: %d bytes\n" "$origsize";
  printf "gzip: %d bytes (%2.2f%%)\n" "$gzipsize" "$ratio";
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

# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
tre() {
  tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less -FRNX;
}


#
# generate pdf from org (needs a running emacs daemon)
#
orgtopdf() {
    filename=$(grealpath "$1")
    echo "emacsclient --eval \"(progn (find-file \\\"$filename\\\") (org-latex-export-to-pdf))\""
    emacsclient --eval "(progn (find-file \"$filename\") (org-latex-export-to-pdf))"
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

laureaPrimoLivelloCalAdd() {
    if [ -z "$1"  ]; then
       echo "cal-add-laurea-primo-livello 'MM/DD/YYYY HH:mm' "
    else
        gcalcli \
            --duration 90 \
            --calendar "Vittorio Zaccaria" \
            --description "Laurea di primo livello" \
            --title "Laurea di primo livello" \
            --where "Sala conferenze - DEIB - Milano (MI)" \
            --reminder "60" \
            add \
            --nocache \
            --when "$1";
    fi
}

sezioneCalAdd() {
    if [ -z "$1" ]; then
        echo "cal-add-sezione 'MM/DD/YYYY HH:mm' "
    else
        gcalcli \
            --duration 90 \
            --calendar "Vittorio Zaccaria" \
            --description "Riunione di sezione" \
            --title "Riunione di sezione" \
            --where "Sala conferenze - DEIB - Milano (MI)" \
            --reminder "60" \
            add \
            --nocache \
            --when "$1";
    fi
}

ccsMecCalAdd() {
    if [ -z "$1" ]; then
        echo "cal-add-sezione 'MM/DD/YYYY HH:mm' "
    else
        gcalcli \
            --duration 90 \
            --calendar "Vittorio Zaccaria" \
            --description "CCS Meccanica" \
            --title "CCS Meccanica" \
            --where "Bovisa" \
            --reminder "60" \
            add \
            --nocache \
            --when "$1";
    fi
}

consiglioDipartimentoCalAdd() {
    if [ -z "$1" ]; then
        echo "consiglio-dipartimento-cal-add 'MM/DD/YYYY HH:mm' "
    else
        gcalcli \
            --duration 90 \
            --calendar "Vittorio Zaccaria" \
            --description "Consiglio di Dipartimento" \
            --title "Consiglio di Dipartimento" \
            --where "Sala conferenze - DEIB - Milano (MI)" \
            --reminder "60" \
            add \
            --nocache \
            --when "$1";
    fi
}

manmd() {
    pandoc -s -f markdown+all_symbols_escapable -t man "$@" | sed 's/\[C\]/\[B\]/g' | groff -T utf8 -man | less 
}

help() {
if [ -f ./help.md ]
then
    manmd ./help.md
    else 
    if [ -f ./readme.md ]
    then 
    manmd ./readme.md
fi
fi
}



alias emacsclient=/usr/local/bin/emacsclient

vi() {
    emacsclient -nw "$@" -c
}

dashboard() {
    vi ~/Dropbox/org/dashboard.org
}

gvim() {
    /Applications/Emacs.app/Contents/MacOS/bin/emacsclient "$@" -c
}

startemacs() {
    /usr/local/bin/emacs --daemon
}

stopemacs() {
    emacsclient -e "(kill-emacs)"
}


restartemacs() {
    stopemacs
    sleep 2
    startemacs
}

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
    else
        input=$(basename "$1" .mov)
        rm -f "$input.gif"
        ffmpeg -i "$1" -s 600x400 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > "$input.gif"
    fi
}

map() {
    command=$1
    args=${*:2}
    xargs -0 -n 1 -J _ "$command" "$args"
}

fmap() {
    command=$1
    args=${*:2}
    xargs -0 -n 1 -J _ "$command" "$args" | tr '\n' '\0'
}

stack-docs() {
    open "$(stack path --local-doc-root)"
}

stack-docs-dir() {
    cd "$(stack path --local-doc-root)"
}
