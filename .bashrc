# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export EDITOR=`which vim`

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 2 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$ '
    #PS1='\[\033[32m\]\u@\h:\[\033[33m\]\w\[\033[32m\]$\[\033[0m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; then
	  if [ -f "$HOME/.dircolors" ]; then
		  eval `dircolors -b $HOME/.dircolors`
	  else
		  eval `dircolors -b`
      fi
    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

if [ `uname` == "Linux" ]; then
    alias pps='ps -u "$USER" -o user,pid,ppid,pcpu,pmem,args'
    alias ls='ls --color=auto '
fi;

if [ `uname` == "FreeBSD" -o `uname` == "Darwin" ]; then
    export LSCOLORS='dxfxcxdxbxegedabagacad'
    alias ls='ls -G '
fi;

#export GREP_COLOR='1;32'
#export GREP_OPTIONS='--color=auto'

#SCREEN_OPTIONS=''
#if [ "$LANG" == "ru_RU.UTF-8" ]; then
#	SCREEN_OPTIONS='-U'
#fi;

export LANG=ru_RU.UTF-8
export LC_TIME=C
export LC_MESSAGES=C

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# join multi-line commands
shopt -s cmdhist

# append history
shopt -s histappend
# via https://habr.com/post/31326/
#PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

export HISTIGNORE="&:ls:[bf]g:exit"
export HISTSIZE=15000
export HISTTIMEFORMAT="%h %d %H:%M:%S "

HISTHOST=`hostname`
HISTFILE="$HISTFILE-$HISTHOST"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# iTerm2: advanced features : http://www.worldgoneweb.com/2011/iterm2-advanced-features/
growl() { echo -e $'\e]9;'${1}'\007' ; return  ; }
