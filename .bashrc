# .bashrc

# History config
HISTSIZE=10000000
HISTFILESIEZE=10000000
shopt -s histappend
HISTCONTROL=ignoreboth
HISTTIMEFORMAT='%F %T '
shopt -s cmdhist

# Directory related
alias ls="eza --icons --group-directories-first --header -al --time-style long-iso"
alias exat="eza -aT --icons --color=always --group-directories-first"
alias bashrc="source ~/.bashrc"
alias fupdate="doas dnf update && flatpak update"
alias crd="composer run dev"
alias run15="ollama run deepseek-r1:1.5b"
alias gemma3="ollama run gemma3"
alias pestp="./vendor/bin/pest --parallel 2>/dev/null"
alias pest="./vendor/bin/pest"

# zoxide
eval "$(zoxide init bash)"

# information when openning a new terminal
macchina

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# php
export PATH="/home/mau/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/home/mau/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

# fnm
FNM_PATH="/home/mau/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi

# esp32 and esp8266
export PATH="$PATH:$HOME/esp/xtensa-esp32-elf/bin"

# golang
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/usr/local/tinygo/bin

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

case ":$PATH:" in
    *:/home/mau/.juliaup/bin:*)
        ;;

    *)
        export PATH=/home/mau/.juliaup/bin${PATH:+:${PATH}}
        ;;
esac

# <<< juliaup initialize <<<

# pnpm
export PNPM_HOME="/home/mau/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# starship
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export STARSHIP_CACHE=~/.config/starship/cache
eval "$(starship init bash)"
. "$HOME/.cargo/env"
