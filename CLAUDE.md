# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

### Formatting and Linting
- **Format code**: Use `<Alt-S>` in normal or visual mode (maps to conform.nvim)
- **Manual linting**: `<leader>ll` to trigger linting for current file
- **Show linters**: `<leader>li` to show available linters for current filetype
- **Stylua**: Format Lua files with `stylua .` (configured for 120 column width, 2-space indents)
- **Biome**: Format JS/TS files with `biome format .` and `biome lint .`
- **Ruff**: Format Python files with `ruff format .` (configured for 76 character line length)

### Plugin Management
- **Lazy manager**: `<leader>ll` to open Lazy.nvim
- **Install plugins**: `<leader>li` 
- **Update plugins**: `<leader>lu`
- **Clean plugins**: `<leader>lc`
- **Profile plugins**: `<leader>lp`

### Mason Tool Management
- **Mason interface**: `<leader>cm` to open Mason
- **Auto-install**: Tools are automatically installed via Mason configuration

## Architecture Overview

This is a modern Neovim configuration built with Lua, organized into a modular plugin system using Lazy.nvim as the package manager.

### Core Structure
- **init.lua**: Entry point that loads all configuration modules
- **lua/config/**: Core configuration modules (autocmd, lsp, options, diagnostic, neovide)
- **lua/plugins/**: Plugin specifications organized by functionality
- **lua/plugins/language/**: Language-specific plugin configurations
- **lua/eduardo/**: Custom utilities and components (icons, lualine components)
- **lsp/**: Individual LSP server configurations
- **snippets/**: Custom snippets for various languages

### Key Configuration Patterns
- **Plugin loading**: Uses Lazy.nvim with imports from `plugins/` and `plugins/language/`
- **LSP setup**: Centralized in `lua/config/lsp.lua` with individual server configs in `lsp/`
- **Formatting**: Managed by conform.nvim with format-on-save enabled
- **Linting**: Handled by nvim-lint with auto-lint on save and text changes
- **Tool management**: Mason.nvim ensures LSP servers, formatters, and linters are installed

### Language Support
- **Lua**: stylua formatter, selene linter, lua-language-server
- **JavaScript/TypeScript**: biome formatter/linter, typescript-language-server
- **Python**: ruff formatter/linter, python-lsp-server
- **Web**: HTML/CSS/JSON support with prettier and tailwindcss-language-server
- **Shell**: shellcheck linter, shfmt formatter, bash-language-server

### Code Style Configuration
- **Lua**: 2-space indents, 120 column width, Unix line endings (stylua.toml)
- **JavaScript/TypeScript**: Double quotes, semicolons as needed (biome.json)
- **Python**: 76 character line length, skip magic trailing comma (ruff.toml)

### Plugin Categories
- **LSP**: Mason, nvim-lspconfig, lspsaga for enhanced LSP experience
- **Completion**: blink.cmp for completion engine
- **Formatting/Linting**: conform.nvim, nvim-lint with Mason tool management
- **UI**: lualine, incline, snacks.nvim for status line and notifications
- **Git**: Various git integration plugins
- **Language-specific**: Treesitter, astro, tailwind, markdown support

### Development Workflow
1. Plugins are managed via Lazy.nvim with lazy loading for performance
2. LSP servers, formatters, and linters are auto-installed via Mason
3. Format-on-save is enabled for all supported file types
4. Linting runs automatically on save and text changes
5. Global leader key is `<space>`, local leader is `,`

## File Organization
- Keep plugin configurations in `lua/plugins/` as separate files
- Language-specific configurations go in `lua/plugins/language/`
- LSP server configurations are in `lsp/` directory
- Custom utilities and components in `lua/eduardo/`
- Configuration files (stylua.toml, biome.json, etc.) in root directory