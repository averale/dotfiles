#!/bin/bash
#^-it's just for auto-enable syntax highlite.

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


if [ `uname` == "Darwin" ]; then
	alias cdf='eval `osascript /Applications/Utilities/OpenTerminal.app/Contents/Resources/Scripts/OpenTerminal.scpt `'
fi;

# If we working with Communiware instance.
if [ "$CMWID" ]; then
	# Add CMW_ID to env.
    PS1="$CMWID:$PS1"

	# Adding some useful aliases for cmw.
	alias cdcld='cd `cmwopt LOGDIR`'
	alias cdcr='cd `cmwopt CMWROOT`'
	alias cdcpl='cd `cmwopt PERLLIB`'

	# FIXME: possible it's special handling for cmw1.dolphin.
    if [ "$CMWID" == "cmw1" ]; then
        export LANG="ru_RU.KOI8-R"
    fi
fi
