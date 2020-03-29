# Mostly from https://github.com/mathiasbynens/dotfiles/blob/master/.aliases

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though

alias h="history 400"

# Global git aliases

colorflag=""

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
fi

if ls -G > /dev/null 2>&1; then
   colorflag="-G"
fi

# List all files colorized in long format
alias l='exa --long --git'
#alias l="ls -ltrF ${colorflag}"

# Alphabetic order
alias ll="ls -lF ${colorflag}"


# List all files colorized in long format, including dot files
alias la="ls -ltraF ${colorflag}"

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

# Always use color output for `ls`
alias ls="command ls ${colorflag}"
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'


# IP addresses
alias ip-show-remote="dig +short myip.opendns.com @resolver1.opendns.com"
alias ip-show-local="ipconfig getifaddr en0"
alias ip-show-all-local="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en0' -t '^(GET|POST) ' 'tcp and port 80'"

# Make
alias mk='make -f makefile.mk'

# Silver searcher
alias ag="ag --hidden --ignore '*.map'"

alias gen-preview="convert -density 45 -depth 8 -quality 85 -delete 1--1"

alias this-week-gcal="gcalcli calw 1 -w 15"
alias next-week-gcal="gcalcli calw 2 -w 15"
alias this-month-gcal="gcalcli calm -w 20"
alias next-month-gcal="gcalcli -w 20 calm"

alias tx='tmuxinator'
alias start-neomutt=' mutt-vmbox -f ~/dotfiles/notmuch-vmbx/mboxes.yml > ~/.neomutt-mboxes && mutt-vmbox -f ~/dotfiles/notmuch-vmbx/mboxes.yml > ~/.neomutt-mboxes && termcss ~/dotfiles/neomutt/.neomutt-config/color-themes/mutt-colors-css-test.muttrc.orig > ~/dotfiles/neomutt/.neomutt-config/color-themes/mutt-colors-css-test.muttrc && neomutt'

alias vpi='vz-poli incarichi `pass poli`'
alias vph='vz-poli home `pass poli`'
alias vz-fineco-mov-cc='vz-bank-mov fineco-movimenti `pass fineco-comune`'
alias vz-popso-mov-cc='vz-bank-mov popso-movimenti `pass popso-comune`'
alias vz-fineco-mov-pers='vz-bank-mov fineco-movimenti `pass fineco-personal`'

alias vz-fineco-carte-cc='vz-bank-mov fineco-carte `pass fineco-comune`'
alias vz-fineco-carte-pers='vz-bank-mov fineco-carte `pass fineco-personal`'

alias y='stty sane'
alias wk='pkill -f watchman org2pdf jslatex tikz2pdf'
