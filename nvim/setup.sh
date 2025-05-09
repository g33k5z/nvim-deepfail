#!/bin/bash

# Script to set up Neovim configuration from scratch
# Author: g33k5z
# Migrated from LunarVIM to a handrolled Neovim configuration

echo "Setting up handrolled Neovim configuration..."

# Make the script executable
chmod +x $0

# Install required dependencies using Homebrew (if on macOS)
if command -v brew &> /dev/null; then
  echo "Installing required dependencies with Homebrew..."
  brew install ripgrep fd stylua luarocks
fi

# Create directories if they don't exist
mkdir -p ~/.config/nvim/lua/{core,plugins,keymap,lsp}

# TypeScript Language Server
npm install -g typescript-language-server typescript-language

# Set execute permissions
chmod +x ~/.config/nvim/setup.sh

echo "Basic setup complete!"
echo "Launch Neovim with 'nvim' to complete the installation of plugins."
echo "Lazy.nvim will automatically install all the plugins on first launch."
echo ""
echo "To update plugins later, run :Lazy update in Neovim."
echo ""
echo "Enjoy your new Neovim configuration!"
