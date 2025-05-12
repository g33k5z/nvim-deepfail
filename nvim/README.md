
# Handrolled Neovim Configuration

This is a handrolled Neovim configuration migrated from LunarVIM, focusing on maintaining the same functionality while providing more control and customization.

## Structure

```
~/.config/nvim/

├── init.lua                            # Entry point
├── lazy-lock.json                      # Plugin version lock file
├── after/                              # After-load configurations
│   └── ftplugin/                       # Filetype-specific settings
│       └── python.lua                  # Python-specific settings
├── lua/
│   ├── core/                           # Core configurations
│   │   ├── appearance.lua              # UI settings
│   │   ├── keymaps.lua                 # Basic keymappings
│   │   ├── lazy.lua                    # Plugin manager setup
│   │   └── options.lua                 # Neovim options
│   ├── keymap/                         # Advanced keymap configurations
│   │   └── which-key/                  # Which-key integration
│   │       ├── groups/                 # Keymap groups by functionality
│   │       │   ├── T-treesitter.lua    # Treesitter keymaps (<leader>T)
│   │       │   ├── b-buffers.lua       # Buffer management (<leader>b)
│   │       │   ├── d-debug.lua         # Debugging features (<leader>d)
│   │       │   ├── g-git.lua           # Git operations (<leader>g)
│   │       │   ├── h-harpoon.lua       # Quick file navigation (<leader>h)
│   │       │   ├── j-copilot.lua       # GitHub Copilot integration (<leader>j)
│   │       │   ├── l-lsp.lua           # LSP functionality (<leader>l)
│   │       │   ├── m-mason.lua         # Package manager (<leader>m)
│   │       │   ├── p-plugins.lua       # Plugin management (<leader>p)
│   │       │   ├── r-refactor.lua      # Code refactoring (<leader>r)
│   │       │   ├── s-search.lua        # Search operations (<leader>s)
│   │       │   ├── t-trouble.lua       # Diagnostics via Trouble (<leader>t)
│   │       │   ├── z-chatgpt.lua       # ChatGPT integration (<leader>z)
│   │       │   └── single-mappings.lua # Standalone key mappings
│   │       ├── init.lua                # Which-key initialization
│   │       ├── loader.lua              # Keymap loader
│   │       └── register.lua            # Keymap registration
│   ├── lsp/                            # LSP configurations
│   │   └── lsp.lua                     # LSP setup
│   └── plugins/                        # Plugin configurations
│       ├── ai.lua                      # AI tools (Copilot, ChatGPT)
│       ├── editor.lua                  # Editor enhancements
│       ├── git.lua                     # Git integrations
│       ├── terminal.lua                # Terminal features
│       └── ui.lua                      # UI components
├── setup.sh                            # Installation script
└── README.md                           # This file
```

## Features

This configuration includes:

- 🚀 Fast startup with lazy-loading plugins via [lazy.nvim](https://github.com/folke/lazy.nvim)
- 🎨 Tokyo Night color scheme
- 🧠 LSP (Language Server Protocol) support with advanced configuration
- 🔍 Fuzzy finding with Telescope
- 🔧 Code completion with nvim-cmp
- 🐙 Git integration with Gitsigns and Lazygit
- 📝 AI assistance with GitHub Copilot and ChatGPT
- 🐛 Debugging with DAP (Debug Adapter Protocol)
- 🔄 Code refactoring tools
- ⚠️ Diagnostics handling with Trouble
- 🐍 Python-specific settings and enhancements
- 📊 Status line and tab line
- 📁 File explorer with NvimTree
- ⚡ Quick file navigation with Harpoon
- 🔄 TMUX navigation integration
- 📦 Package management with Mason
- 📚 Which-Key for discoverable keymaps

## Installation

1. Run the setup script:
   ```bash
   ~/.config/nvim/setup.sh
   ```

2. Launch Neovim:
   ```bash
   nvim
   ```

3. Lazy.nvim will automatically install all plugins on first launch.

## Keymaps

The leader key is set to `Space`. Keymaps are organized using Which-Key for better discoverability.

### General

- `<leader>h` - Clear highlights
- `<S-q>` - Close buffer
- `<C-s>` - Toggle Copilot auto-trigger

### Navigation

- `<C-h/j/k/l>` - Navigate between windows
- `<S-h/l>` - Navigate between buffers

### Harpoon (Quick Navigation)

- `<leader>h` - Harpoon menu
- `<leader>ha` - Add file to Harpoon
- `<leader>he` - Toggle Harpoon menu
- `<leader>h1-4` - Jump to Harpoon file 1-4

### Find (Telescope)

- `<leader>f` - Find menu
- `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `<leader>fb` - Find buffer
- `<leader>fr` - Recent files

### LSP

- `<leader>l` - LSP menu
- `gd` - Go to definition
- `gr` - Find references
- `K` - Show hover information
- `<leader>lr` - Rename
- `<leader>la` - Code action

### Git

- `<leader>g` - Git menu
- `<leader>gg` - Lazygit
- `<leader>gb` - Blame line
- `<leader>gd` - Diff this

### Terminal

- `<C-\>` - Toggle terminal

### AI Tools

- `<leader>j` - Copilot menu
- `<leader>z` - ChatGPT menu

### Treesitter

- `<leader>T` - Treesitter menu

### Debug

- `<leader>d` - Debug menu

### Trouble/Diagnostics

- `<leader>t` - Trouble/diagnostics menu

### Refactor

- `<leader>r` - Refactoring menu

### Mason

- `<leader>m` - Mason package manager menu

### Buffers

- `<leader>b` - Buffer management menu

### Search

- `<leader>s` - Additional search options

All keymaps are organized in `lua/keymap/which-key/groups/` and accessible through the WhichKey popup by pressing `<leader>`.

## Plugins

This configuration uses [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management. See the `lua/plugins/` directory for individual plugin configurations.

To update plugins, run `:Lazy update` in Neovim.

## Customization

To customize this configuration:

1. Edit the core settings in `lua/core/`
2. Modify plugin configurations in `lua/plugins/`
3. Add new plugins by creating or editing files in `lua/plugins/`
4. Update keymaps in `lua/keymap/which-key/groups/`
5. Add filetype-specific settings in `after/ftplugin/`

Key files to modify:
- `lua/core/options.lua` - Neovim core options
- `lua/core/appearance.lua` - Visual appearance settings
- `lua/plugins/*.lua` - Plugin configurations
- `lua/keymap/which-key/groups/*.lua` - Keymaps for specific features

## Credits

This configuration was migrated from LunarVIM, with inspiration from various Neovim configurations in the community.
