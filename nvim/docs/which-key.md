# Which-Key Discovery

Which-Key is a keybinding discovery tool for Neovim that displays a popup with available keybindings as you type. This configuration uses Which-Key extensively to organize and document all custom mappings.

## Root Menu

When you press the `<leader>` key (set to `Space`), you are presented with the root menu:

![Which-Key Root Menu](images/whichkey.png)

This menu serves as the entry point to most of the configuration's features.

## Self-Annotating & Discovery

One of the most powerful features of Which-Key is that it is **self-annotating**. You don't need to memorize every keybinding. 

- **Discovery**: If you forget a mapping, just press the prefix (like `<leader>g` for Git) and wait a moment. Which-Key will show you all available sub-commands and their descriptions.
- **Filtering**: You can type to filter the list of available mappings in real-time.
- **Icons**: The menu uses icons to help you quickly identify different types of actions.

## Core Mappings

Here is a breakdown of the top-level mappings available from the root menu:

### Single Actions
- `B` -> Messages Scratch (buffer) - Dumps `:messages` into a temporary buffer
- `q` -> Quit (with confirmation)
- `w` -> Save current file
- `/` -> Toggle comment (works in Normal and Visual mode)
- `;` -> Open Dashboard (Alpha)
- `c` -> Close current buffer
- `e` -> Toggle File Explorer (NvimTree)
- `f` -> Find Files (Telescope)
- `h` -> Clear search highlights

### Groups (Press key to see more)
- `b` -> **+Buffers**: Buffer management (list, navigation, etc.)
- `d` -> **+Debug**: Debug Adapter Protocol (DAP) controls
- `g` -> **+Git**: Git operations (Lazygit, blame, diffs)
- `j` -> **+Copilot**: GitHub Copilot AI assistance
- `l` -> **+LSP**: Language Server Protocol actions (rename, code actions, etc.)
- `m` -> **+Mason**: Package manager for LSP/DAP/Linters
- `p` -> **+Plugins**: Lazy.nvim plugin manager
- `r` -> **+Refactor**: Code refactoring tools
- `s` -> **+Search**: Advanced search options (grep, symbols, etc.)
- `t` -> **+Trouble**: Diagnostics and issue tracking
- `T` -> **+Treesitter**: Treesitter information and tools
- `z` -> **+ChatGPT**: ChatGPT integration

## Customizing Mappings

All Which-Key mappings are defined in the `lua/keymap/which-key/groups/` directory. This configuration uses a modular approach where each file represents a menu group or a set of related mappings.

### Naming Convention

To make it easy to find where a specific keybinding is defined, files follow a naming convention based on their trigger key:

- **Group Files**: Named as `{key}-{name}.lua`.
  - `g-git.lua` -> Contains all mappings under `<leader>g`
  - `t-trouble.lua` -> Contains all mappings under `<leader>t`
  - `l-lsp.lua` -> Contains all mappings under `<leader>l`
- **Single Mappings**: The `single-mappings.lua` file is used for top-level actions that don't have a sub-menu (like `<leader>w` for Save or `<leader>f` for Find File).

The `loader.lua` script automatically scans this directory and registers all mappings found within these files. To add a new group, simply create a new file following the `{key}-{name}.lua` pattern and return a table of mappings.
