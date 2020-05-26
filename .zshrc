if [ -d ~/bin ]; then
	export PATH="$PATH:$HOME/bin"
fi
if which plenv > /dev/null; then eval "$(plenv init - zsh)"; fi
[ -f ~/.iterm2_shell_integration.zsh ] && source ~/.iterm2_shell_integration.zsh
