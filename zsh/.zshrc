# p10k theme
source ~/powerlevel10k/powerlevel10k.zsh-theme

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# zsh suggestions
autoload -Uz colors && colors
zstyle ":completion:*:commands" rehash 1

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    autoload -Uz compinit
    compinit
fi

# history
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=1000000

# share .zshhistory
setopt inc_append_history   # 実行時に履歴をファイルにに追加していく
setopt share_history        # 履歴を他のシェルとリアルタイム共有する

typeset -U path PATH
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

# mise
eval "$(/Users/yusuke/.local/bin/mise activate zsh)"

# grep color
export GREP_OPTIONS='--color=auto' 

# 独自コマンドのパスを通す
export PATH=$PATH:/Users/yusuke/bin

# Flutter
export PATH="$PATH:/Users/yusuke/fvm/default/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"

# Go
export PATH="$PATH:/Users/yusuke/go/bin"
export PATH="/Users/yusuke/istio-1.20.0/bin:$PATH"

# Android
export ANDROID_HOME=/Users/yusuke/Library/Android/sdk
export NDK_HOME=/Users/yusuke/Library/Android/sdk/ndk/23.1.7779620

# llvm
export PATH="/opt/homebrew/opt/llvm@17/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm@17/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm@17/include"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Cargo
. "$HOME/.cargo/env"

# Azure
source '/Users/yusuke/lib/azure-cli/az.completion'

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/yusuke/.dart-cli-completion/zsh-config.zsh ]] && . /Users/yusuke/.dart-cli-completion/zsh-config.zsh || true

## [/Completion]
export PATH="$PATH:$HOME/fvm/default/bin"

# zoxide
eval "$(zoxide init zsh)"
# bun completions
[ -s "/Users/yusuke/.bun/_bun" ] && source "/Users/yusuke/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# istio
export PATH="/Users/yusuke/istio-1.25.0/bin:$PATH"

# protoc
export PATH="$PATH:$(go env GOPATH)/bin"
