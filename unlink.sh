#!/bin/bash
set -e

echo "dotfilesのシンボリックリンクを削除します..."

# シンボリックリンクを削除する関数
remove_symlink() {
    local path=$1
    local name=$2

    if [ -L "$path" ]; then
        echo "シンボリックリンクを削除: $path"
        rm "$path"
    elif [ -e "$path" ]; then
        echo "警告: $path はシンボリックリンクではありません（スキップ）"
    else
        echo "スキップ: $path は存在しません"
    fi
}

# Zshの設定
remove_symlink "$HOME/.zshrc" "zshrc"
remove_symlink "$HOME/.zsh_aliases" "zsh_aliases"
remove_symlink "$HOME/.p10k.zsh" "p10k.zsh"

# Gitの設定
remove_symlink "$HOME/.gitconfig" "gitconfig"
remove_symlink "$HOME/.git_commit_template" "git_commit_template"

# VSCodeの設定
VSCODE_CONFIG_DIR="$HOME/.config/Code/User"
remove_symlink "$VSCODE_CONFIG_DIR/settings.json" "vscode settings.json"

# Weztermの設定
WEZTERM_CONFIG_DIR="$HOME/.config/wezterm"
remove_symlink "$WEZTERM_CONFIG_DIR/wezterm.lua" "wezterm.lua"
remove_symlink "$WEZTERM_CONFIG_DIR/keybinds.lua" "keybinds.lua"

# Neovimの設定
NVIM_CONFIG_DIR="$HOME/.config/nvim"
remove_symlink "$NVIM_CONFIG_DIR" "nvim"

echo "dotfilesのunlinkが完了しました！"
