# Neovim Directory Structure on macOS

On **macOS**, **Neovim** (`nvim`) uses several directories for configuration, runtime files, plugins, etc. Here are the key directories you should know:

---

### 1. **Configuration Directory**
- `~/.config/nvim/`
  - This is the **primary user config directory**, where `init.vim` or `init.lua` lives.

### 2. **Data Directory**
- `~/.local/share/nvim/`
  - This is the **user data directory**. Plugins installed via plugin managers (like `packer.nvim` or `vim-plug`), undo history, shada (shared data), swap, and other runtime files are stored here.

### 3. **State Directory**
- `~/.local/state/nvim/`
  - This stores **stateful data** (e.g., logs, swap files, sessions).

### 4. **Cache Directory**
- `~/.cache/nvim/`
  - Used for **temporary files** such as plugin cache, LSP server downloads, etc.

### 5. **System Wide Directories (less commonly used for users):**
- `/usr/local/share/nvim/`
  - System-wide runtime files, usually affects all users.
- `/etc/xdg/nvim/`
  - System-wide configuration. Usually rare for single-user setups on macOS.

---

## **Summary Table**

| Purpose               | Directory                           |
|-----------------------|-------------------------------------|
| Config                | `~/.config/nvim/`                   |
| Data                  | `~/.local/share/nvim/`              |
| State                 | `~/.local/state/nvim/`              |
| Cache                 | `~/.cache/nvim/`                    |
| System config (rare)  | `/etc/xdg/nvim/`                    |
| System data           | `/usr/local/share/nvim/`            |

---

### **Check Locations in Neovim**
Within Neovim, you can run these commands to see your actual paths:

```vim
:echo stdpath('config')
:echo stdpath('data')
:echo stdpath('state')
:echo stdpath('cache')
```

---

#### **References**
- [`:h nvim-from-vim`](https://neovim.io/doc/user/nvim.html#nvim-from-vim)
- [`:h stdpath()`](https://neovim.io/doc/user/lua.html#vim.fn.stdpath)

---

**In summary:**  
Most user interactions are with `~/.config/nvim/` (for config), but plugins and data live in `~/.local/share/nvim/` and `~/.cache/nvim/` is for temp/cache files.
