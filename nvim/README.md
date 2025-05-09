# Handrolled Neovim Configuration

This is a handrolled Neovim configuration migrated from LunarVIM, focusing on maintaining the same functionality while providing more control and customization.

## Structure

```
~/.config/nvim/
├── init.lua                 # Entry point
├── lua/
│   ├── core/               # Core configurations
│   │   ├── appearance.lua  # UI settings
│   │   ├── keymaps.lua     # Basic keymappings
│   │   ├── lazy.lua        # Plugin manager setup
│   │   └── options.lua     # Neovim options
│   └── plugins/            # Plugin configurations
│       ├── ai.lua          # AI tools (Copilot, ChatGPT)
│       ├── editor.lua      # Editor enhancements
│       ├── lsp.lua         # LSP configurations
│       └── ui.lua          # UI components
├── setup.sh                # Installation script
└── README.md               # This file
```

## Features

This configuration includes:

- 🚀 Fast startup with lazy-loading plugins
- 🎨 Tokyo Night color scheme
- 🧠 LSP (Language Server Protocol) support
- 🔍 Fuzzy finding with Telescope
- 🔧 Code completion with nvim-cmp
- 🐙 Git integration with Gitsigns
- 📝 Copilot and ChatGPT AI assistance
- 🐍 Python debugging and testing
- 📊 Status line and tab line
- 📁 File explorer with NvimTree
- ⚡ Quick file navigation with Harpoon
- 🔄 TMUX navigation integration

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

The leader key is set to `Space`.

### General

- `<leader>h` - Clear highlights
- `<S-q>` - Close buffer
- `<C-s>` - Toggle Copilot auto-trigger

### Navigation

- `<C-h/j/k/l>` - Navigate between windows
- `<S-h/l>` - Navigate between buffers

### Harpoon

- `<leader>a` - Add file to Harpoon
- `<C-e>` - Toggle Harpoon menu
- `<leader>1-4` - Jump to Harpoon file 1-4

### Find (Telescope)

- `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `<leader>fb` - Find buffer
- `<leader>fr` - Recent files

### LSP

- `gd` - Go to definition
- `gr` - Find references
- `K` - Show hover information
- `<leader>rn` - Rename
- `<leader>ca` - Code action

### File Explorer

- `<leader>e` - Toggle NvimTree

### Terminal

- `<C-\>` - Toggle terminal

See `lua/core/keymaps.lua` and the WhichKey popup (`<leader>`) for more keymaps.

## Plugins

This configuration uses [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management. See the `lua/plugins/` directory for individual plugin configurations.

To update plugins, run `:Lazy update` in Neovim.

## Customization

To customize this configuration:

1. Edit the core settings in `lua/core/`
2. Modify plugin configurations in `lua/plugins/`
3. Add new plugins by creating or editing files in `lua/plugins/`

## Credits

This configuration was migrated from LunarVIM, with inspiration from various Neovim configurations in the community.