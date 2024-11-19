# My nvim config, a study in deepfail
young bones heal quickly edition

Story here is my painful switch to nvim from vim, but my supprising productivity now that I don't spend all day tweaking a custom color theme

- Grabbed lunarvim as a base (shutup)
- plugins
  - Python everything (shutup)
    - LSP: pyright
    - Debugger: degubpy, DAP  
    - Formatters: ruff, black, prettify
  - Copilot.nvim/.lua: suggestions are kinda garbo, grabbed the lua version, fuck the cmp integration, ghosting is better
  - ChatGPT.nvim: Has some good bones, hacking it into something useful. So far model/token max updates while I learn the package
  - Vimtex: for latex math notes, but is in some kinda fuggly state
  - bunch of random ass others 

- whichkey
  - Got ChatGPT more or less up
  - Copilot is a pita so far to remap in WK
  - folke/trouble mapped
  - ThePrimeagen/refactoring mapped 

- TODOs
  - cmp: move this spam further away from the cursor
  - copilot WK mapping
  - gippity overhaul prompt templates to suck less, rework some of the UI
  - override/add translation for vim-regex to pcre
  - obsidian connector
  - finish setting up vimtex/latex everything

- tmux
    - config added
    - reserection kinda works? panes/windows restore, nvim state still a wip

- starship
    - config added

### Keyremapping ftw? 
- caps_lock => escape, is my norm only mapping
- Trying [Dygma Defy](https://dygma.com/pages/defy) split keybort
 

### Term misc
- https://starship.rs/
- https://github.com/lsd-rs/lsd
- https://www.nerdfonts.com/


### Installed nonsense 
#### Mason dump 
    ◍ bash-language-server bashls
    ◍ black
    ◍ debugpy
    ◍ dockerfile-language-server dockerls
    ◍ html-lsp html
    ◍ htmlbeautifier
    ◍ htmx-lsp htmx
    ◍ jedi-language-server jedi_language_server
    ◍ lua-language-server lua_ls
    ◍ prettier
    ◍ pydocstyle
    ◍ pylint
    ◍ pyproject-flake8
    ◍ pyright
    ◍ python-lsp-server pylsp
    ◍ ruff
    ◍ stylua
    ◍ tailwindcss-language-server tailwindcss
    ◍ vim-language-server vimls
    ◍ yaml-language-server yamlls

#### Lazyvim dump 
    ● alpha-nvim 1.85ms  VimEnter
    ● bigfile.nvim 3.49ms  BufReadPre
    ● bufferline.nvim 10.21ms  User FileOpened
    ● ChatGPT.nvim 19.44ms  VeryLazy
    ● cmp-buffer 3.12ms  nvim-cmp
    ● cmp-nvim-lsp 1.64ms  nvim-cmp
    ● cmp-path 1.86ms  nvim-cmp
    ● cmp_luasnip 16.14ms  nvim-cmp
    ● Comment.nvim 5ms  User FileOpened
    ● copilot.lua 1.35ms  InsertEnter
    ● duckytype.nvim 3.52ms  start
    ● friendly-snippets 0.74ms  LuaSnip
    ● gitsigns.nvim 4.84ms  User FileOpened
    ● harpoon 0.93ms  start
    ● hologram.nvim 5.4ms  start
    ● indent-blankline.nvim 4.09ms  User FileOpened
    ● lazy.nvim 9.11ms  init.lua
    ● lualine.nvim 15.18ms  VimEnter
    ● LuaSnip 38.06ms  InsertEnter
    ● lunar.nvim 0.27ms  start
    ● mason-lspconfig.nvim 18.78ms  nvim-lspconfig
    ● mason-null-ls.nvim 6.71ms  BufReadPre
    ● mason.nvim 3.8ms  mason-lspconfig.nvim
    ● neotest 0.92ms  start
    ● neotest-python 0.11ms  start
    ● nlsp-settings.nvim 0.64ms  nvim-lspconfig
    ● none-ls.nvim 0.59ms  mason-null-ls.nvim
    ● nui.nvim 0.62ms  ChatGPT.nvim
    ● nvim-autopairs 7.38ms  InsertEnter
    ● nvim-cmp 24.84ms  CmdlineEnter
    ● nvim-dap-python 0.1ms  start
    ● nvim-lspconfig 20.17ms 󰢱 lspconfig.server_configurations.tailwindcss  tailwind-tools.nvim
    ● nvim-navic 1.89ms  User FileOpened
    ● nvim-tree.lua 52.92ms  NvimTreeToggle
    ● nvim-treesitter 21.79ms  tailwind-tools.nvim
    ● nvim-ts-context-commentstring 1.27ms 󰢱 ts_context_commentstring  nvim-treesitter
    ● nvim-web-devicons 0.73ms 󰢱 nvim-web-devicons  nvim-tree.lua
    ● plenary.nvim 0.85ms  harpoon
    ● project.nvim 2.48ms 󰢱 telescope._extensions.projects  telescope.nvim
    ● refactoring.nvim 24.21ms  start
    ● ripgrep 0.08ms  start
    ● tailwind-tools.nvim 87.53ms  start
    ● telescope-fzf-native.nvim 0.37ms  telescope.nvim
    ● telescope.nvim 36.25ms 󰢱 telescope  tailwind-tools.nvim
    ● toggleterm.nvim 14.52ms 󰢱 toggleterm.terminal  
    ● vim-be-good 0.61ms  start
    ● vim-illuminate 7.81ms  User FileOpened
    ● vimtex 1.96ms  start
    ● which-key.nvim 26.78ms  VeryLazy


## Setup (macOS)

### nvim >= 0.10.x

Install
```shell
brew install neovim

# https://github.com/neovim/neovim/blob/master/INSTALL.md
```


Refresh shell (or restart it) and check version
```shell
source ~/.zshrc

nvim --version

#  NVIM v0.10.2
#  Build type: Release
#  LuaJIT 2.1.1727870382
#  Run "nvim -V1 -v" for more info
```

### LunarVim (Nightly)
```shell
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

# https://www.lunarvim.org/docs/installation
```

### tmux
```shell
brew install tmux

# https://github.com/tmux/tmux/wiki/Installing
```

https://github.com/tmux/tmux/wiki/Getting-Started#configuring-tmux

#### tmux package manager
```shell
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# https://github.com/tmux-plugins/tpm
```


#### Config
copy `.tmux.config` to `$HOME` | `~/`

Once tmux is running you can press `<LEADER> + I` to install plugins defined in .tmux.conf
tmux LEADER is defaulted to `CTRL+B`, and will be `CTRL+A` with my config

#### tmuxifier
```shell
git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier

export PATH="$HOME/.tmuxifier/bin:$PATH"


# https://github.com/jimeh/tmuxifier
```

Add to .zshrc
```shell
export PATH="$HOME/.tmuxifier/bin:$PATH"
eval "$(tmuxifier init -)"

#used for root of tmuxifier layouts
export DEV_ROOT="~/dev/github"

# https://github.com/jimeh/tmuxifier
```
