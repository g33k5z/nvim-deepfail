# Starship Configuration

This directory contains the custom configuration for [Starship](https://starship.rs/), a minimal, blazing-fast, and infinitely customizable prompt for any shell.

## What is Starship?

Starship provides a feature-rich, cross-shell prompt that displays relevant information at a glance, such as:
*   Current Git branch and status
*   Programming language versions (Node.js, Python, Rust, etc.)
*   Cloud provider context (AWS, GCP, Azure)
*   And much more.

This configuration (`starship.toml`) customizes the appearance and behavior of the Starship prompt to fit the aesthetic and informational needs of this development environment.

## Installation

For full installation instructions, please refer to the [official Starship documentation](https://starship.rs/#prerequisites).

By shell
```bash
curl -sS https://starship.rs/install.sh | sh
```

On macOS, you can typically install it using Homebrew:

```bash
brew install starship
```

## Configuration

This repository includes a custom `starship.toml` file that defines the prompt's appearance, including specific symbols for various programming languages and environments.

To use this configuration, you should symlink it or copy it to the default Starship configuration location:

```bash
# Option 1: Symlink (recommended for easy updates)
ln -sfn "$(pwd)/starship.toml" ~/.config/starship.toml

# Option 2: Copy
cp "$(pwd)/starship.toml" ~/.config/starship.toml
```

## Enabling Starship in Your Shell

After installing Starship and setting up the configuration, you need to enable it in your shell's configuration file (e.g., `~/.zshrc`, `~/.bashrc`, `~/.config/fish/config.fish`).

Add the following line to the end of your shell's configuration file:

**For Zsh:**
```bash
eval "$(starship init zsh)"
```

**For Bash:**
```bash
eval "$(starship init bash)"
```

**For Fish:**
```fish
starship init fish | source
```

After adding the line, restart your shell or `source` the configuration file (`source ~/.zshrc`) to see the changes.
