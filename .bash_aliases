#!/bin/bash
#^-it's just for auto-enable syntax highligth for bash.

alias tmux="TERM=screen-256color-bce tmux"

alias scr="screen $SCREEN_OPTIONS -D -RR "
alias scrr="screen $SCREEN_OPTIONS -r "
alias scrls="screen $SCREEN_OPTIONS -ls "

alias dfh='df -h'
alias h=history
alias q=exit
#alias j=jobs

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias ltr='ls -ltr'

# youtube-dl
alias ydl4="youtube-dl --add-metadata --embed-subs --embed-thumbnail -f 'medium[ext=mp4]+bestaudio[ext=m4a]/mp4'"
alias ydlw="youtube-dl --add-metadata --embed-subs --embed-thumbnail -f worst"
alias ydl3="youtube-dl --add-metadata --extract-audio --audio-format=mp3 --embed-thumbnail -o '%(title)s.%(ext)s'"

# Env and aliases for work with Communiware instance.
if [ "$CMWID" ]; then
	# Add CMW_ID to env.
    PS1="$CMWID:$PS1"

	# Adding some useful aliases for cmw.
	alias cdcld='cd `cmwopt LOGDIR`'
	alias cdcr='cd `cmwopt CMWROOT`'
	alias cdcpl='cd `cmwopt PERLLIB`'
fi
