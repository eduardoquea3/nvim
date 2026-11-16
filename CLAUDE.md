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
- Go: Mason manages `gopls` and `golangci-lint`; `gofmt` is supplied with the Go toolchain.
- Rust: Mason manages `rust-analyzer` and `rustfmt`; Clippy is supplied with the Rust toolchain and is run by rust-analyzer.

## Architecture Overview

This is a modern Neovim configuration built with Lua, organized into a modular plugin system using Lazy.nvim as the package manager.

### Core Structure
- **init.lua**: Entry point that loads all configuration modules
- **lua/config/**: Core configuration modules (autocmd, lsp, options, diagnostic, neovide)
- **lua/plugins/**: Plugin specifications organized by responsibility:
  - **ai/**: Claude, OpenCode, and Supermaven integrations
  - **database/**: Database tools
  - **editing/**: Editing, commenting, folding, indentation, and text toggles
  - **git/**: Git integration
  - **language/**: Completion, formatting/linting, LSP, Markdown, Mason, and language tooling
  - **navigation/**: Snacks navigation/picker and which-key
  - **terminal/**: Terminal integration
  - **ui/**: Themes, statusline, icons, visual enhancements, and screenshots
- **lua/eduardo/**: Custom utilities and components (icons, lualine components)
- **lsp/**: Individual LSP server configurations
- **snippets/**: Custom snippets for various languages

### Key Configuration Patterns
- **Plugin loading**: Uses explicit Lazy.nvim imports for each responsibility folder under `lua/plugins/`
- **LSP setup**: Centralized in `lua/config/lsp.lua` with individual server configs in `lsp/`
- **Formatting**: Conform formats on `<Alt-S>` in normal or visual mode; saving does not format automatically
- **Linting**: Handled by nvim-lint with auto-lint on save and text changes
- **Tool management**: Mason.nvim ensures LSP servers, formatters, and linters are installed

### Language Support
- **Lua**: stylua formatter, selene linter, lua-language-server
- **JavaScript/TypeScript**: biome formatter/linter, typescript-language-server
- **Python**: ruff formatter/linter, python-lsp-server
- **Web**: HTML/CSS/JSON support with prettier and tailwindcss-language-server
- **Shell**: shellcheck linter, shfmt formatter, bash-language-server
- **Go**: `gofmt` formatter, `golangci-lint` diagnostics on save (or `<leader>ll` manually), and `gopls` with staticcheck
- **Rust**: `rustfmt` formatter and rust-analyzer diagnostics via Clippy (`check.command = "clippy"`); no Rust nvim-lint entry

### Code Style Configuration
- **Lua**: 2-space indents, 120 column width, Unix line endings (stylua.toml)
- **JavaScript/TypeScript**: Double quotes, semicolons as needed (biome.json)
- **Python**: 76 character line length, skip magic trailing comma (ruff.toml)

### Plugin Categories
- **AI**: Claude, OpenCode, and Supermaven
- **Database**: Database tooling
- **Editing**: Auto-tagging, boolean toggles, commenting, folding, indentation, word highlighting, and toggles
- **Git**: Git integration
- **Language**: blink.cmp, Conform, nvim-lint, lspsaga, Markdown, Mason, Tailwind, Treesitter, and the HTTP/JSON/YAML tools
- **Navigation**: Snacks picker/navigation and which-key
- **Terminal**: Terminal integration
- **UI**: CodeSnap, devicons, Folke utilities, Incline, Lualine, NvChad UI, picker UI, rainbow delimiters, themes, and Tiny

### Development Workflow
1. Plugins are managed via Lazy.nvim with lazy loading for performance
2. LSP servers, formatters, and linters are auto-installed via Mason
3. Use `<Alt-S>` to format supported files; saving does not format automatically
4. Linting runs automatically on save and text changes
5. Global leader key is `<space>`, local leader is `,`

## File Organization
- Keep plugin configurations in `lua/plugins/` as separate files
- Language-specific configurations go in `lua/plugins/language/`
- LSP server configurations are in `lsp/` directory
- Custom utilities and components in `lua/eduardo/`
- Configuration files (stylua.toml, biome.json, etc.) in root directory