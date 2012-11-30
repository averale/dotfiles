#!/bin/bash
#^-it's just for auto-enable syntax highligth for bash.

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

# Env and aliases for work with Communiware instance.
if [ "$CMWID" ]; then
	# Add CMW_ID to env.
    PS1="$CMWID:$PS1"

	# Adding some useful aliases for cmw.
	alias cdcld='cd `cmwopt LOGDIR`'
	alias cdcr='cd `cmwopt CMWROOT`'
	alias cdcpl='cd `cmwopt PERLLIB`'
fi
