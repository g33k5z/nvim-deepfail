# Keymaps

The leader key is set to `Space`. Keymaps are organized using Which-Key for better discoverability.

For a visual guide on how to discover keybindings using Which-Key, see the **[Which-Key Discovery](which-key.md)** page.

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
- `<leader>B` - Messages Scratch buffer

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

---

All keymaps are organized in `lua/keymap/which-key/groups/` and accessible through the WhichKey popup by pressing `<leader>`.