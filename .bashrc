# .bashrc

# History config
HISTSIZE=10000000
HISTFILESIEZE=10000000
shopt -s histappend
HISTCONTROL=ignoreboth
HISTTIMEFORMAT='%F %T '
shopt -s cmdhist

# Directory related
alias ls="exa --icons --group-directories-first --header -al --time-style long-iso"
alias exat="exa -aT --icons --color=always --group-directories-first"
alias bashrc="source ~/.bashrc"
alias fupdate="sudo dnf update"

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
export PATH="/home/mau/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/home/mau/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

# fnm
FNM_PATH="/home/mau/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi

# golang
export PATH=$PATH:/usr/local/go/bin

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

# starship
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export STARSHIP_CACHE=~/.config/starship
eval "$(starship init bash)"

