# ===== 基本設定 =====
# history 設定
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=1000000

# 履歴共有の設定
setopt inc_append_history   # 実行時に履歴をファイルにに追加していく
setopt share_history        # 履歴を他のシェルとリアルタイム共有する

# ===== パス設定 =====
# 重複パスを削除
typeset -U path PATH

# 基本パス設定
path=(
  /opt/homebrew/bin(N-/)
  /opt/homebrew/sbin(N-/)
  /usr/bin
  /usr/sbin
  /bin
  /sbin
  /usr/local/bin(N-/)
  /usr/local/sbin(N-/)
  /Library/Apple/usr/bin
)

# ユーザー定義コマンドのパス
export PATH="$PATH:/Users/yusuke/bin"

# ===== powerlevel10k テーマ設定 =====
# Enable Powerlevel10k instant prompt (高速起動のため最上部に配置)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# p10k テーマ読み込み
source ~/powerlevel10k/powerlevel10k.zsh-theme

# p10k 設定ファイル読み込み
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ===== zsh 補完・サジェスト設定 =====
autoload -Uz colors && colors
zstyle ":completion:*:commands" rehash 1

# Homebrew 関連の補完設定
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    autoload -Uz compinit
    compinit
fi

# ===== 開発環境設定 =====
# mise (バージョン管理ツール)
eval "$(/Users/yusuke/.local/bin/mise activate zsh)"

# Flutter 設定
export PATH="$PATH:/Users/yusuke/fvm/default/bin"
export PATH="$PATH:$HOME/.pub-cache/bin"

# Go 設定
export PATH="$PATH:/Users/yusuke/go/bin"
export PATH="$PATH:$(go env GOPATH)/bin"  # protoc のために追加

# GHC
[ -f "/Users/yusuke/.ghcup/env" ] && . "/Users/yusuke/.ghcup/env" # ghcup-env

# Android 設定
export ANDROID_HOME=/Users/yusuke/Library/Android/sdk
export NDK_HOME=/Users/yusuke/Library/Android/sdk/ndk/23.1.7779620

# LLVM 設定
export PATH="/opt/homebrew/opt/llvm@17/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm@17/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm@17/include"

# nvm (Node.js バージョン管理)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Cargo (Rust パッケージマネージャ)
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# Bun 設定
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"  # Bun 補完

# Istio 設定 (最新バージョンのみ残す)
export PATH="/Users/yusuke/istio-1.25.0/bin:$PATH"

# ===== その他のツール設定 =====
# grep カラー設定
export GREP_OPTIONS='--color=auto' 

# zoxide (ディレクトリ移動の高度化)
eval "$(zoxide init zsh)"

# Azure CLI 補完
[ -f '/Users/yusuke/lib/azure-cli/az.completion' ] && source '/Users/yusuke/lib/azure-cli/az.completion'

# Dart CLI 補完
[ -f "$HOME/.dart-cli-completion/zsh-config.zsh" ] && source "$HOME/.dart-cli-completion/zsh-config.zsh"

# エイリアス設定の読み込み
[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases

# ===== SDKMAN 設定 (ファイル末尾に必要) =====
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"
