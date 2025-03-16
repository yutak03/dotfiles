# dotfiles

A repository to manage personal configuration files (dotfiles) for MacOS. Includes shell configurations, editor settings, and various development tool settings.

## Included Configurations

- **Shell Configurations**:
  - zsh (`.zshrc`, `.zsh_aliases`, `.zshenv`)
  - [Powerlevel10k](https://github.com/romkatv/powerlevel10k) theme configuration (`.p10k.zsh`)

- **Git Configurations**:
  - `.gitconfig`
  - Git commit template

- **Terminal Configurations**:
  - [WezTerm](https://wezfurlong.org/wezterm/) configuration

- **Editor Configurations**:
  - Visual Studio Code settings

## Prerequisites

The following tools should be installed:

- [zsh](https://www.zsh.org/)
- [Homebrew](https://brew.sh/)
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- [exa](https://the.exa.website/) (ls alternative)
- [zoxide](https://github.com/ajeetdsouza/zoxide) (cd alternative)
- [WezTerm](https://wezfurlong.org/wezterm/) (terminal emulator)
- [mise](https://github.com/jdx/mise) (runtime version manager)

## Installation

1. Clone the repository:

```bash
git clone https://github.com/yutak03/dotfiles.git ~/.dotfiles
```

2. Run the installation script:

```bash
cd ~/.dotfiles
./deploy.sh
```

This script creates symbolic links for each configuration file in your home directory. If existing files are found, backups will be created.

## Customization

### Zsh Configuration

- Edit `.zshrc` to add plugins or other configurations
- Add frequently used command aliases to `.zsh_aliases`

### Git Configuration

Edit `.gitconfig` to set your name and email:

```
[user]
	name = Your Name
	email = your.email@example.com
```

### WezTerm Configuration

Edit `wezterm/wezterm.lua` to customize your terminal emulator settings.

## Features

### Zsh Aliases

Several convenient aliases are included:

- File operations: `ls`→`exa`, `ll`, `la`, etc.
- Git commands: `gs`, `ga`, `gc`, `gp`, etc.
- Editor launchers: `rr`, `ij`, `pc`, `ans`, etc.

### Development Environments

Path configurations for the following development environments are included:

- Flutter/Dart
- Go
- Rust (Cargo)
- Node.js (NVM)
- Android SDK
- Java (SDKMAN)
- LLVM
- Protobuf
