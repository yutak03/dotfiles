#!/bin/bash
set -e

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "dotfilesをインストールします..."

# シンボリックリンクを作成する関数
create_symlink() {
    local src=$1
    local dst=$2
    
    # 既存のファイルがあればバックアップ
    if [ -f "$dst" ] || [ -d "$dst" ]; then
        echo "バックアップを作成: $dst -> ${dst}.backup"
        mv "$dst" "${dst}.backup"
    fi
    
    # シンボリックリンクを作成
    echo "リンクを作成: $src -> $dst"
    ln -sf "$src" "$dst"
}

# Zshの設定
create_symlink "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
create_symlink "$DOTFILES_DIR/zsh/.zsh_aliases" "$HOME/.zsh_aliases"
create_symlink "$DOTFILES_DIR/zsh/.p10k.zsh" "$HOME/.p10k.zsh"


# Gitの設定
create_symlink "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"
create_symlink "$DOTFILES_DIR/git/.git_commit_template" "$HOME/.git_commit_template"

# VSCodeの設定（ディレクトリが存在する場合のみ）
VSCODE_CONFIG_DIR="$HOME/.config/Code/User"
if [ -d "$VSCODE_CONFIG_DIR" ]; then
    create_symlink "$DOTFILES_DIR/vscode/settings.json" "$VSCODE_CONFIG_DIR/settings.json"
fi

# Weztermの設定
WEZTERM_CONFIG_DIR="$HOME/.config/wezterm"
if [ ! -d "$WEZTERM_CONFIG_DIR" ]; then
    echo "Weztermの設定ディレクトリを作成: $WEZTERM_CONFIG_DIR"
    mkdir -p "$WEZTERM_CONFIG_DIR"
fi
create_symlink "$DOTFILES_DIR/wezterm/wezterm.lua" "$WEZTERM_CONFIG_DIR/wezterm.lua"
create_symlink "$DOTFILES_DIR/wezterm/keybinds.lua" "$WEZTERM_CONFIG_DIR/keybinds.lua"

# Neovimの設定
NVIM_CONFIG_DIR="$HOME/.config/nvim"
if [ -L "$NVIM_CONFIG_DIR" ] || [ -e "$NVIM_CONFIG_DIR" ]; then
    echo "バックアップを作成: $NVIM_CONFIG_DIR -> ${NVIM_CONFIG_DIR}.backup"
    mv "$NVIM_CONFIG_DIR" "${NVIM_CONFIG_DIR}.backup"
fi
echo "リンクを作成: $DOTFILES_DIR/nvim -> $NVIM_CONFIG_DIR"
ln -sf "$DOTFILES_DIR/nvim" "$NVIM_CONFIG_DIR"

echo "dotfilesのインストールが完了しました！"