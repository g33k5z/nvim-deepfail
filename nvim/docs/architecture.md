# Architecture & Structure

This document describes the directory structure and the purpose of various files in this modern Neovim (0.11+) configuration.

## Directory Structure

```
~/.config/nvim/

├── init.lua                                # Entry point
├── .luarc.jsonc                            # Lua language server config
├── docs/                                   # Documentation
├── lazy-lock.json                          # Plugin version lock file
├── after/                                  # After-load configurations
│   └── ftplugin/                           # Filetype-specific settings
│       └── python.lua                      # Python-specific settings
├── lua/
│   ├── core/                               # Core configurations
│   │   ├── appearance.lua                  # UI settings
│   │   ├── keymaps.lua                     # Basic keymappings
│   │   ├── lazy.lua                        # Plugin manager setup
│   │   └── options.lua                     # Neovim options
│   ├── keymap/                             # Advanced keymap configurations
│   │   ├── which-key.lua                   # Which-key main config
│   │   └── which-key/                      # Which-key integration details
│   │       ├── groups/                     # Keymap groups by functionality
│   │       │   ├── T-treesitter.lua        # Treesitter keymaps (<leader>T)
│   │       │   ├── b-buffers.lua           # Buffer management (<leader>b)
│   │       │   ├── B-buffer-scratch.lua    # Msg/Buffer/Scratch (<leader>B)
│   │       │   ├── d-debug.lua             # Debugging features (<leader>d)
│   │       │   ├── g-git.lua               # Git operations (<leader>g)
│   │       │   ├── h-harpoon.lua           # Quick file navigation (<leader>h)
│   │       │   ├── j-copilot.lua           # GitHub Copilot integration (<leader>j)
│   │       │   ├── l-lsp.lua               # LSP functionality (<leader>l)
│   │       │   ├── m-mason.lua             # Package manager (<leader>m)
│   │       │   ├── p-plugins.lua           # Plugin management (<leader>p)
│   │       │   ├── r-refactor.lua          # Code refactoring (<leader>r)
│   │       │   ├── s-search.lua            # Search operations (<leader>s)
│   │       │   ├── t-trouble.lua           # Diagnostics via Trouble (<leader>t)
│   │       │   ├── z-chatgpt.lua           # ChatGPT integration (<leader>z)
│   │       │   └── single-mappings.lua     # Standalone key mappings
│   │       ├── init.lua                    # Which-key initialization
│   │       ├── loader.lua                  # Keymap loader
│   │       └── register.lua                # Keymap registration
│   ├── lsp/                                # LSP configurations
│   │   └── lsp.lua                         # LSP setup
│   └── plugins/                            # Plugin configurations
│       ├── ai.lua                          # AI tools (Copilot, ChatGPT)
│       ├── completion.lua                  # Completion engine (cmp)
│       ├── editor.lua                  # Editor enhancements
│       ├── git.lua                         # Git integrations
│       ├── lsp.lua                         # LSP plugin config
│       ├── terminal.lua                # Terminal features
│       └── ui.lua                      # UI components
├── setup.sh                                # Installation script
└── README.md                               # Landing page
```
