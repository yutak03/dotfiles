# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

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

# fvm global version
export PATH="$PATH:$HOME/fvm/default/bin"

# mise
if type mise &>/dev/null; then
  eval "$(mise activate zsh)"
  eval "$(mise activate --shims)"
fi

# asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# zoxide
eval "$(zoxide init zsh)"

# Cargo
. "$HOME/.cargo/env"
. "$HOME/.local/bin/env"
## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/yutak/.dart-cli-completion/zsh-config.zsh ]] && . /Users/yutak/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

# MySQL
export PATH="/opt/homebrew/opt/mysql@8.0/bin:$PATH"

# llvm
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# Alias
alias ls='exa'
alias ll='ls -l'
alias la='ls -la'
alias rr='open -a "RustRover"'
alias ws='open -a "WebStorm"'
alias rd='open -a "Rider"'
alias as='open -a "Android Studio"'
alias flutter="fvm flutter"
alias prev='open -a "Preview.app"'
