# Dotfiles Setup Guide

This repository contains a comprehensive terminal and development environment configuration featuring Tmux, Zsh, and Neovim. This guide will walk you through setting up everything from scratch.

## Overview

This dotfiles configuration provides:

- **Tmux**: Terminal multiplexer with custom keybindings, plugins, and Catppuccin theme
- **Zsh**: Shell configuration with Oh My Zsh and Catppuccin theme
- **Neovim**: Modern Vim editor with extensive plugin configuration
- **Integration**: Seamless navigation between Tmux panes and Neovim windows

The Dotfile directory should reside in your machine's home directory (`~`) and using directory linking you can connect the configs in the `Dotfiles` directory to the correct local paths.

## Prerequisites

Before setting up this configuration, ensure you have the following installed:

### Required Software

1. **Homebrew** (macOS package manager)

    ```bash
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```

2. **Tmux** (Terminal multiplexer)

    ```bash
    brew install tmux
    ```

3. **Zsh** (Shell)

    ```bash
    brew install zsh
    ```

4. **Neovim** (Modern Vim editor)

    ```bash
    brew install neovim
    ```

5. **Git** (Version control)
    ```bash
    brew install git
    ```

### Optional but Recommended Tools

The configuration includes keybindings for these tools, so installing them will unlock additional functionality:

1. **LazyGit** (Git UI)

    ```bash
    brew install lazygit
    ```

2. **LazyDocker** (Docker UI)

    ```bash
    brew install lazydocker
    ```

3. **Ranger** (File manager)

    ```bash
    brew install ranger
    ```

4. **IPython** (Interactive Python)

    ```bash
    brew install ipython
    ```

5. **FZF** (Fuzzy finder)

    ```bash
    brew install fzf
    ```

6. **Memory Pressure** (System monitoring)
    ```bash
    brew install memory_pressure
    ```

## Installation Steps

### Step 1: Clone the Repository

```bash
git clone <your-repo-url> ~/Dotfiles
cd ~/Dotfiles
```

### Step 2: Install Oh My Zsh

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Step 3: Install Zsh Plugins

The configuration uses `zsh-autosuggestions`. Install it:

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

### Step 4: Install Catppuccin Theme for Zsh

```bash
git clone https://github.com/catppuccin/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### Step 5: Link Configuration Files

Create symbolic links to your home directory:

```bash
# Link zsh configuration
ln -sf ~/Dotfiles/.zshrc ~/.zshrc

# Link tmux configuration
ln -sf ~/Dotfiles/.tmux.conf ~/.tmux.conf

# Link Neovim configuration (if you want to use the included nvim config)
ln -sf ~/Dotfiles/nvim ~/.config/nvim
```

### Step 6: Install Tmux Plugin Manager (TPM)

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### Step 7: Install Tmux Plugins

Start a new tmux session and install plugins:

```bash
# Start tmux
tmux

# Press Ctrl-a + I to install plugins
# (The configuration will automatically install all required plugins)
```

### Step 8: Reload Your Shell

```bash
# Reload zsh configuration
source ~/.zshrc

# Or restart your terminal
```

## Configuration Features

### Tmux Features

- **Custom Prefix**: `Ctrl-a` instead of default `Ctrl-b`
- **Window/Pane Indexing**: Starts from 1 instead of 0
- **Split Panes**:
    - `Ctrl-a + |` for vertical split
    - `Ctrl-a + -` for horizontal split
- **Pane Resizing**: `Ctrl-a + hjkl` for resizing panes
- **Pane Zooming**: `Ctrl-a + m` to zoom/unzoom current pane
- **Config Reload**: `Ctrl-a + r` to reload configuration
- **Vim Mode**: Copy mode uses vim keybindings
- **Mouse Support**: Enabled for pane selection and resizing

#### Tmux Popup Windows

The configuration includes several convenient popup windows:

- `Ctrl-a + y`: LazyGit (Git interface)
- `Ctrl-a + d`: LazyDocker (Docker interface)
- `Ctrl-a + n`: Create new tmux session
- `Ctrl-a + j`: Switch between tmux sessions (with fzf)
- `Ctrl-a + p`: IPython
- `Ctrl-a + x`: Ranger file manager
- `Ctrl-a + z`: Edit .zshrc
- `Ctrl-a + t`: New terminal popup
- `Ctrl-a + w`: Edit AWS config files

#### Tmux Menu

Press `Ctrl-a + d` to access the dotfiles menu for quick editing of configuration files.

### Zsh Features

- **Oh My Zsh**: Framework with plugins and themes
- **Catppuccin Theme**: Beautiful, modern theme with mocha flavor
- **Auto-suggestions**: Command suggestions based on history
- **Auto-correction**: Enabled for command typos
- **Custom Aliases**:
    - `python` → `python3`
    - `vim` → `nvim`
    - `consult` → Navigate to consulting directory
    - `pied` → Install Python dev dependencies

#### Directory Shortcuts

The configuration includes several directory shortcuts:

- `~repos` → Consulting documents directory
- `~agentsuite` → AgentSuite project directory
- `~de` → Deployment environment directory
- `~dm` → Deployment management directory
- `~mp` → Media pipeline directory
- `~p2a` → Process2Agent directory
- `~nvc` → Neovim config directory

### Neovim Integration

The configuration includes `tmux-navigator` plugin for seamless navigation between tmux panes and Neovim windows using `Ctrl-hjkl`.

## Customization

### Changing Themes

To change the Catppuccin flavor, edit both files:

1. **Zsh**: Change `CATPPUCCIN_FLAVOR` in `~/.zshrc`
2. **Tmux**: Change `@catppuccin_flavour` in `~/.tmux.conf`

Available flavors: `mocha`, `frappe`, `macchiato`, `latte`

### Adding New Aliases

Add custom aliases to the `~/.zshrc` file in the aliases section.

### Modifying Tmux Keybindings

Edit the `~/.tmux.conf` file to customize keybindings. The configuration is well-commented for easy modification.

## Troubleshooting

### Common Issues

1. **Tmux plugins not loading**: Ensure TPM is installed and run `Ctrl-a + I` in tmux
2. **Zsh theme not working**: Verify Oh My Zsh and Catppuccin theme are properly installed
3. **Permission issues**: Make sure you have write permissions to your home directory
4. **Symbolic links not working**: Ensure the dotfiles directory path is correct

### Reloading Configurations

- **Zsh**: Run `source ~/.zshrc` or restart terminal
- **Tmux**: Press `Ctrl-a + r` or restart tmux session

## Additional Notes

- The configuration assumes macOS with Homebrew package manager
- Some features require additional tools (LazyGit, Ranger, etc.) to be installed
- The setup includes AWS configuration shortcuts (requires AWS CLI setup)
- Memory pressure monitoring requires the `memory_pressure` tool

## Support

If you encounter any issues during setup, please check:

1. All prerequisites are installed
2. Symbolic links are created correctly
3. Required plugins are installed
4. File permissions are correct

For additional help, refer to the individual tool documentation:

- [Tmux Manual](https://man.openbsd.org/tmux)
- [Oh My Zsh Documentation](https://github.com/ohmyzsh/ohmyzsh)
- [Catppuccin Theme](https://github.com/catppuccin/catppuccin)

