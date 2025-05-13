# How to Clear All Neovim Data (but keep your config)

To **clear all Neovim data (but leave your configuration)** on macOS—essentially making Neovim behave like a fresh install but without losing your `~/.config/nvim` folder—**you just need to wipe Neovim's data, state, and cache directories.** Your config is untouched.

### **Steps**

#### **1. Remove Neovim Data, State, and Cache Directories**

You can do this with the following commands in your terminal:

```sh
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
```

**What this does:**
- `~/.local/share/nvim` — removes installed plugins, session and shada files, LSP data, etc.
- `~/.local/state/nvim` — removes swap files, logs, and other stateful info.
- `~/.cache/nvim` — removes cache files created by plugins or Neovim itself.

#### **2. (Optional) Remove Plugin Manager Directories (if outside stdpaths)**
If you installed plugin managers (like `vim-plug`, `packer.nvim`, or `dein`) somewhere else, also remove those directories if you want **truly** clean data.  
*For most users, managers live under `~/.local/share/nvim/`. Check your config if unsure.*

#### **3. Start Neovim**
The next time you start Neovim, it will act as if it's just been installed. Plugins etc., will be re-downloaded as needed by your config/setup.

---

### **Summary Table**

| Keep                | Remove                                 |
|---------------------|----------------------------------------|
| `~/.config/nvim/`   | `~/.local/share/nvim/`                 |
|                     | `~/.local/state/nvim/`                 |
|                     | `~/.cache/nvim/`                       |

---

#### **Tip:**  
If you want to be extra careful, **back up the directories before deleting them**, e.g.:
```sh
mv ~/.local/share/nvim ~/.local/share/nvim_bak
```

---

**That’s it!**  
Leaving your config and deleting those three directories makes Neovim start out “clean” while keeping your customizations.
