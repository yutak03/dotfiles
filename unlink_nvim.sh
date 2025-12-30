#!/bin/bash
set -e

NVIM_CONFIG_DIR="$HOME/.config/nvim"

# シンボリックリンクかどうか確認
if [ -L "$NVIM_CONFIG_DIR" ]; then
    echo "シンボリックリンクを削除: $NVIM_CONFIG_DIR"
    rm "$NVIM_CONFIG_DIR"
    echo "nvimのunlinkが完了しました"
else
    echo "警告: $NVIM_CONFIG_DIR はシンボリックリンクではありません"
    exit 1
fi
