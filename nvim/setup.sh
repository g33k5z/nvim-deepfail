#!/bin/bash

# Script to set up Neovim configuration
# Works whether run from the repo or already placed in ~/.config/nvim

set -e # Exit on error

REPO_NVIM_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TARGET_DIR="$HOME/.config/nvim"

echo "💎 🙌 🚀  Setting up handrolled Neovim configuration..."

# 1. Symlink check: If not in ~/.config/nvim, offer to link it
if [ "$REPO_NVIM_DIR" != "$TARGET_DIR" ]; then
    echo "Current directory is $REPO_NVIM_DIR"
    echo "Target directory is $TARGET_DIR"
    
    if [ -d "$TARGET_DIR" ] && [ ! -L "$TARGET_DIR" ]; then
        echo "⚠️  Existing directory found at $TARGET_DIR. Backing it up to ${TARGET_DIR}.bak"
        mv "$TARGET_DIR" "${TARGET_DIR}.bak"
    fi

    if [ ! -L "$TARGET_DIR" ]; then
        echo "🔗 Creating symlink: $TARGET_DIR -> $REPO_NVIM_DIR"
        mkdir -p "$HOME/.config"
        ln -s "$REPO_NVIM_DIR" "$TARGET_DIR"
    fi
fi

# 2. System Dependencies (macOS/Homebrew)
if [[ "$OSTYPE" == "darwin"* ]]; then
    if command -v brew &> /dev/null; then
        echo "🍺 Checking/Installing system dependencies with Homebrew..."
        # Note: 'neovim' is included here. If users want 0.11+ specifically before it hits stable,
        # they might need 'brew install neovim --HEAD', but 'neovim' is the standard choice.
        brew install neovim ripgrep fd stylua luarocks
    else
        echo "⚠️  Homebrew not found. Please install neovim, ripgrep, fd, stylua, and luarocks manually."
    fi
fi

# 3. Node/LSP Dependencies
if command -v npm &> /dev/null; then
    echo "📦 Installing global TypeScript tools..."
    npm install -g typescript-language-server typescript
else
    echo "⚠️  npm not found. Skipping global TypeScript LSP installation."
fi

# 4. Final Permissions
chmod +x "$REPO_NVIM_DIR/setup.sh"

echo ""
echo "✨ Setup complete!"
echo "👉 Launch Neovim with 'nvim' to finish plugin installation."
echo "   Lazy.nvim will automatically download all plugins on first start."
