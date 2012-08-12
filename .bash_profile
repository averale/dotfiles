# ~/.bash_profile: executed by bash(2) for login shells.
# see /usr/share/doc/bash/examples/startup-files for examples

#echo "PATH=$PATH"
umask 022

# set variable identifying the chroot you work in
#if [ -f /etc/debian_chroot ]; then
#  debian_chroot=$(cat /etc/debian_chroot)
#fi

# include .bashrc if it exists
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

if [ -d ~/scripts ] ; then
    PATH="${HOME}/scripts:${PATH}"
fi

# NOTICE: By default, OS X 10.6 uses /usr/libexec/path_helper to add the
# following paths listed in the file /etc/paths.

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    PATH="${HOME}/bin:${PATH}"
fi

# set PATH to dir with magicwrap's symlinks
if [ `hostname` == 'wasabi' ] ; then
    PATH="/sw/local/ffmpeg/bin:/usr/local/magicwrap/bin/:${PATH}"
fi


# who's logged in the box?
w

# is there are my screen sessions?
screen -ls

# is there are my tmux sessions?
tmux list-sessions

# Setup ssh-agent if ssh forwarding isn't enabled.
KEYCHAIN=""
SSH_AUTH_SOCK_PATH=`env | grep SSH_AUTH_SOCK`
if [ -z "$SSH_AUTH_SOCK_PATH" ]; then
	if [ -f "${HOME}/bin/keychain" ]; then
	  KEYCHAIN="${HOME}/bin/keychain"
	fi;
	if [ "$KEYCHAIN" == "" -a -f "/usr/local/bin/keychain" ]; then
	  KEYCHAIN="/usr/local/bin/keychain"
	fi;
	if [ "$KEYCHAIN" == "" -a -f "/usr/bin/keychain" ]; then
	  KEYCHAIN="/usr/bin/keychain"
	fi;
	if [ "$KEYCHAIN" != "" ]; then
	  #$KEYCHAIN --clear ~/.ssh/identity ~/.ssh/id_rsa
	  $KEYCHAIN ~/.ssh/identity ~/.ssh/id_rsa

	  # for compatibility with old version
	  [[ -f $HOME/.ssh-agent-${HOSTNAME} ]] && \
	  source $HOME/.ssh-agent-${HOSTNAME}

	  # load two ssh keys and one gpg key
	  [[ -f $HOME/.keychain/$HOSTNAME-sh ]] && \
	  source $HOME/.keychain/$HOSTNAME-sh
	  [[ -f $HOME/.keychain/$HOSTNAME-sh-gpg ]] && \
	  source  $HOME/.keychain/$HOSTNAME-sh-gpg
	fi;
else
	echo "SSH_AUTH_SOCK already exists, possibly ssh agent forwarding enabled!"
fi;

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
