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


if [ `uname` == "Darwin" ]; then
	alias cdf='eval `osascript /Applications/Utilities/OpenTerminal.app/Contents/Resources/Scripts/OpenTerminal.scpt `'
fi;


