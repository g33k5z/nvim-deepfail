## Managing Neovim Versions with Bob

[Bob](https://github.com/mordechaihadad/bob) is a cross-platform Neovim version manager that allows you to easily install, switch, and manage multiple Neovim versions.

### Installation

Run the appropriate script for your operating system:

* **macOS / Linux:**
  ```bash
  curl -L https://githubusercontent.com | sh
  ```
* **Windows (PowerShell):**
  ```powershell
  irm https://githubusercontent.com | iex
  ```

*Note: Ensure you add Bob's binary proxy path to your system's `PATH` variable (`~/.local/share/bob/nvim-bin` on Unix or `~\AppData\Local\bob\nvim-bin` on Windows).*

### Quick Start: Install & Use Latest Stable

To automatically download, install, and switch to the latest stable release of Neovim in a single command, run:

```bash
bob use stable
```
*(You can also use `bob use latest` for the exact same result).*

### Common Commands

* **Install without switching:** `bob install stable` (or specify a version like `v0.10.0`, `nightly`)
* **Switch versions:** `bob use <version>`
* **List installed versions:** `bob ls`
* **Uninstall a version:** `bob uninstall <version>`


### PATH Configuration (Required)

Bob works by creating a proxy binary. For your system to find `nvim`, you must add Bob's binary directory to your shell configuration file.

Choose the block that matches your shell, paste it at the end of your configuration file, and restart your terminal.

#### Bash (`~/.bashrc`)
```bash
# Append Bob Neovim proxy binary directory to PATH
export PATH="HOME/.local/share/bob/nvim-bin:PATH"
```

#### Zsh (`~/.zshrc`)
```zsh
# Append Bob Neovim proxy binary directory to PATH
export PATH="HOME/.local/share/bob/nvim-bin:PATH"
```

#### Fish (`~/.config/fish/config.fish`)
```fish
# Append Bob Neovim proxy binary directory to PATH
fish_add_path \$HOME/.local/share/bob/nvim-bin
```

#### Windows PowerShell (`$PROFILE`)
```powershell
# Append Bob Neovim proxy binary directory to PATH
env:PATH += ";env:USERPROFILE\AppData\Local\bob\nvim-bin"
```

---

### Advanced Configuration (`bob.toml`)

You can globally customize Bob's behavior by creating a configuration file. 

* **Linux/macOS Location:** `~/.config/bob/config.toml`
* **Windows Location:** `%USERPROFILE%\AppData\Roaming\bob\config.toml`

#### Example Configuration
```toml
# Enable automatic updates for Bob itself
auto_update = true

# Set a custom installation directory for Neovim versions
# downloads_dir = "/path/to/custom/atoms/"

# Highlight or track a specific proxy output style
[bindings]
# Custom settings for proxy arguments can go here
```

