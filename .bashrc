# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
# if [ -d ~/.bashrc.d ]; then
# 	for rc in ~/.bashrc.d/*; do
# 		if [ -f "$rc" ]; then
# 			. "$rc"
# 	done
# fi

unset rc

fastfetch

export EDITOR=/usr/bin/nvim

if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then
    source ~/.bash_functions
fi

export GPG_TTY=$(tty)

# fnm
export PATH="/home/augusto/.local/share/fnm:$PATH"
eval "$(fnm env)"

export GOPATH="$HOME/go"
PATH="$GOPATH/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

# starship
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export STARSHIP_CACHE=~/.config/starship
eval "$(starship init bash)"
. "$HOME/.cargo/env"


# pnpm
export PNPM_HOME="/home/augusto/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
