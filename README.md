# My nvim config, a study in deepfail
young bones heal quickly edition



![inglourious basterds](images/ex_layout_result.png)




Story here is my painful switch to nvim from vim, but my supprising productivity now that I don't spend all day tweaking a custom color theme


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
  - [mappings](nvim/keymap/whichkey)

- TODOs
  - copilot WK mapping
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
- [core](nvim/core)


## Setup (macOS)

### nvim (via bob)

1.  **Install bob (Neovim version manager)**
    ```shell
    brew install bob
    ```

2.  **Install Neovim stable (or nightly)**
    ```shell
    bob use stable
    ```

3.  **Set up `nvim-deepfail` configuration**
    Clone the repo and sparse checkout the `nvim` folder. Then symlink it to `~/.config/nvim`. See [Sparse Checkout for nvim-deepfail](./docs/sparse-checkout-nvim.md) for detailed instructions.

4.  **Install System Dependencies**
    ```shell
    brew install ripgrep fd stylua luarocks tree-sitter
    npm install -g typescript-language-server typescript
    ```
    Launch Neovim (`nvim`) to automatically install LazyVim plugins and Mason LSPs/formatters/linters.


### [tmux](./docs/tmux.md)
A terminal multiplexer for managing multiple shell sessions.

### [tmuxifier](./docs/tmuxifier.md)
A session manager for tmux, allowing you to create and manage complex layouts.
