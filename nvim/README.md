# Neovim Configuration

A modern, feature-rich Neovim configuration built with Lua and managed by [Lazy.nvim](https://github.com/folke/lazy.nvim). This configuration provides a complete development environment with LSP support, syntax highlighting, file navigation, and much more.

## 🚀 Features

- **Plugin Management**: Lazy.nvim for fast and efficient plugin loading
- **Language Server Protocol**: Full LSP support with Mason for automatic server installation
- **Syntax Highlighting**: Tree-sitter for accurate syntax highlighting
- **File Navigation**: Telescope for fuzzy finding and file management
- **Git Integration**: Git signs and status indicators
- **Code Completion**: nvim-cmp with LSP integration
- **Theming**: Catppuccin color scheme with transparency support
- **Tmux Integration**: Seamless navigation between Neovim and Tmux panes
- **Code Formatting**: Automatic formatting with various formatters
- **Linting**: Integrated linting for multiple languages

## 📋 Prerequisites

### System Requirements

- **Neovim**: Version 0.9.0 or higher
- **Git**: For plugin management and version control
- **Node.js**: Version 16+ (for TypeScript/JavaScript LSP servers)
- **Python**: Version 3.10+ (for Python development)
- **Ripgrep**: For fast text searching (`rg` command)
- **fd**: For fast file finding (`fd` command)

### Installation Commands

#### macOS (using Homebrew)

```bash
# Install Neovim
brew install neovim

# Install required tools
brew install ripgrep fd

# Optional: Install tmux for seamless navigation
brew install tmux
```

#### Ubuntu/Debian

```bash
# Install Neovim
sudo apt update
sudo apt install neovim

# Install required tools
sudo apt install ripgrep fd-find

# Optional: Install tmux
sudo apt install tmux
```

#### Windows (using Chocolatey)

```powershell
# Install Neovim
choco install neovim

# Install required tools
choco install ripgrep fd
```

## 📁 Installation

### 1. Clone the Configuration

```bash
# Create the Neovim config directory (if it doesn't exist)
mkdir -p ~/.config/nvim

# Clone this repository
git clone https://github.com/yourusername/nvim-config.git ~/.config/nvim

# Or if you're using this as a dotfiles setup
git clone https://github.com/yourusername/Dotfiles.git ~/Dotfiles
ln -s ~/Dotfiles/nvim ~/.config/nvim
```

### 2. Directory Structure

The configuration should be placed in one of these locations:

- **Linux/macOS**: `~/.config/nvim/`
- **Windows**: `%LOCALAPPDATA%\nvim\`

Your directory structure should look like this:

```
~/.config/nvim/
├── init.lua                 # Main entry point
├── lazy-lock.json          # Plugin lock file
├── luacheckrc             # Lua linting configuration
├── neoconf.json           # Neoconf settings
└── lua/
    ├── config/            # Core configuration
    │   ├── init.lua       # Plugin manager setup
    │   ├── globals.lua    # Global variables
    │   ├── options.lua    # Neovim options
    │   ├── keymaps.lua    # Key mappings
    │   └── autocmds.lua   # Auto commands
    ├── plugins/           # Plugin configurations
    │   ├── init.lua       # Plugin initialization
    │   ├── catppuccin.lua # Color scheme
    │   ├── mason.lua      # LSP server management
    │   ├── telescope.lua  # File finder
    │   └── ...            # Other plugins
    └── util/              # Utility functions
        ├── keymapper.lua  # Key mapping utilities
        └── lsp.lua        # LSP utilities
```

### 3. First Launch

When you first launch Neovim with this configuration:

1. **Lazy.nvim will auto-install**: The plugin manager will automatically clone and set up
2. **Plugins will be installed**: All plugins will be downloaded and configured
3. **LSP servers will be installed**: Mason will automatically install language servers

```bash
# Launch Neovim
nvim

# Wait for the initial setup to complete (may take a few minutes)
# You'll see installation progress in the command line
```

## 🔧 Configuration

### Key Mappings

The configuration uses `<leader>` (default: space) as the main modifier key:

#### File Navigation

- `<leader>ff` - Find files (Telescope)
- `<leader>fg` - Live grep (Telescope)
- `<leader>fb` - Find buffers (Telescope)
- `<leader>ft` - Help tags (Telescope)
- `<leader>fk` - Keymaps (Telescope)

#### LSP Commands

- `<leader>fd` - Go to definition
- `<leader>fr` - Find references
- `<leader>ca` - Code actions
- `<leader>rn` - Rename symbol

#### Tmux Navigation

- `<C-h>` - Navigate left
- `<C-j>` - Navigate down
- `<C-k>` - Navigate up
- `<C-l>` - Navigate right

### Language Support

This configuration includes LSP support for:

- **Lua** - Lua Language Server
- **Python** - BasedPyright + Ruff
- **TypeScript/JavaScript** - TypeScript Language Server
- **JSON** - JSON Language Server
- **Bash** - Bash Language Server
- **Solidity** - Solidity Language Server
- **HTML/CSS** - Emmet Language Server
- **Docker** - Docker Language Server

### Code Formatting & Linting

The configuration includes automatic formatting and linting for:

- **Lua**: Luacheck (linting) + Stylua (formatting)
- **Python**: Ruff (linting)
- **TypeScript/JavaScript**: ESLint (linting) + Prettier (formatting)
- **JSON**: ESLint + FixJSON
- **Shell**: ShellCheck (linting) + shfmt (formatting)
- **Markdown**: Alex (linting) + Prettier (formatting)
- **Docker**: Hadolint (linting) + Prettier (formatting)
- **Solidity**: Solhint (linting)

## 🎨 Customization

### Color Scheme

The default color scheme is Catppuccin Mocha. You can change it by modifying `lua/config/init.lua`:

```lua
install = {
  colorscheme = { "your-preferred-colorscheme" },
},
```

Available themes in this configuration:

- `catppuccin-mocha`
- `nightfox`

### Adding New Plugins

To add new plugins, create a new file in `lua/plugins/`:

```lua
-- lua/plugins/my-plugin.lua
return {
  "username/my-plugin",
  config = function()
    -- Plugin configuration here
  end,
}
```

### Modifying Key Mappings

Edit `lua/config/keymaps.lua` to modify or add key mappings:

```lua
-- Add your custom key mappings here
mapkey("<leader>mykey", "MyCommand", "n")
```

## 🐛 Troubleshooting

### Common Issues

#### 1. LSP Servers Not Working

```bash
# Open Mason and install missing servers
:Mason

# Or install specific servers
:MasonInstall lua_ls typescript-language-server
```

#### 2. Treesitter Highlighting Issues

```bash
# Update treesitter parsers
:TSUpdate

# Or update all
:TSUpdate all
```

#### 3. Plugin Installation Issues

```bash
# Clean and reinstall plugins
:Lazy clean
:Lazy install
```

#### 4. Slow Startup

```bash
# Check startup time
:checkhealth
:lua print(vim.inspect(vim.g.lazy_load_startup))

# Profile startup
:lua require("lazy").profile()
```

### Health Check

Run Neovim's health check to diagnose issues:

```bash
:checkhealth
```

This will check:

- Neovim version compatibility
- Plugin health
- LSP server status
- Treesitter parser status

## 📚 Additional Resources

- [Neovim Documentation](https://neovim.io/doc/)
- [Lazy.nvim Documentation](https://github.com/folke/lazy.nvim)
- [Mason.nvim Documentation](https://github.com/williamboman/mason.nvim)
- [Telescope.nvim Documentation](https://github.com/nvim-telescope/telescope.nvim)
- [Tree-sitter Documentation](https://tree-sitter.github.io/)
- [Youtube tutorial for Neovim Setup](https://www.youtube.com/watch?v=ZjMzBd1Dqz8)

