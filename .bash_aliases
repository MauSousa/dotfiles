# Directory related
alias ls="exa --icons --group-directories-first --header -al --time-style long-iso"
alias exat="exa -aT --icons --color=always --group-directories-first"

# System related
alias ..="cd ../"
alias fupdate="sudo dnf update"
alias flatupdate="flatpak update"
alias souenv="source env/bin/activate"
alias bashrc="source ~/.bashrc"
alias rm="rm -iv"
alias s="kitty +kitten ssh"
alias sail="./vendor/bin/sail"
alias lara="cd ~/Dev/php-projects/laracasts-php-for-beginners/"
alias larav="cd ~/Dev/php-projects/laracasts-laravel-30-days"
alias dot="cd ~/.config/.dotfiles/"
alias files="bash ~/.config/.dotfiles/files.sh"
alias cl="printf '\E[H\E[3J'"
alias vuef="cd ~/Dev/vue-courses/vue-fernando-herrera"

#  Git
alias pull="git pull"
alias push="git push origin main"
alias commit="git commit"
alias gadd="git add ."
alias ginit="git init"
alias gitbr="git branch"
alias gits="git s"
alias gitd="git diff"
alias gitchk="git checkout"
alias gitsw="git switch"
alias gitst="git stash"
alias gitstc="git stash clear"
alias gitv="git remote -v"

# Docker
alias dimla="docker image ls -a"
alias dclsa="docker container ls -a"
alias dcd="docker compose down"
alias dcud="docker compose up -d"

alias nv="cd ~/.config/nvim/"
