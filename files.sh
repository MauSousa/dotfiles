#!/usr/bin/env bash

# cp -r ~/.config/nvim/ ~/.bashrc ~/.bash_aliases ~/.profile ~/.bash_functions ~/.config/starship ~/terminal.json ~/.config/kitty ~/.config/fastfetch/ ~/.wezterm.lua ~/.config/macchina/ ~/.config/.dotfiles/
# rm -rf ~/.config/.dotfiles/nvim/.git ~/.config/.dotfiles/nvim/.github
DOTFILES_DIR=~/.config/dotfiles

function copy-neovim() {
if [[ -d ~/.config/nvim ]]; then
    cp -r ~/.config/nvim/ "$DOTFILES_DIR"
    rm -rf ~/.config/dotfiles/nvim/.git ~/.config/dotfiles/nvim/.github
fi
}

function copy-bash() {
if [[ -f ~/.bashrc ]]; then
    cp ~/.bashrc "$DOTFILES_DIR"
fi

if [[ -f ~/.bashrc_aliases ]]; then
    cp ~/.bashrc_aliases "$DOTFILES_DIR"
fi

if [[ -f ~/.bashrc_functions ]]; then
    cp ~/.bashrc_functions "$DOTFILES_DIR"
fi

if [[ -f ~/.profile ]]; then
    cp ~/.profile "$DOTFILES_DIR"
fi
}

function copy-fastfetch() {
if [[ -d ~/.config/fastfetch ]]; then
    cp -r ~/.config/fastfetch/ "$DOTFILES_DIR"
fi
}

function copy-starship() {
if [[ -d ~/.config/starship ]]; then
    cp -r ~/.config/starship "$DOTFILES_DIR"
fi
}

function copy-kitty() {
    if [[ -d ~/.config/kitty ]]; then
        cp -r ~/.config/kitty "$DOTFILES_DIR"
    fi
}

function copy-wezterm() {
    if [[ -d ~/.config/wezterm ]]; then
        cp -r ~/.config/wezterm "$DOTFILES_DIR"
    fi
}

function copy-macchina() {
    if [[ -d ~/.config/macchina ]]; then
        cp -r ~/.config/macchina "$DOTFILES_DIR"
    fi
}

function copy-terminal() {
    if [[ -f ~/terminal.json ]]; then
        cp ~/terminal.json "$DOTFILES_DIR"
    fi
}

function copy-files() {
    copy-neovim
    copy-bash
    copy-fastfetch
    copy-starship
    copy-kitty
    copy-wezterm
    copy-macchina
    copy-terminal
}

echo "Copying files..."
copy-files
echo "Done!"
