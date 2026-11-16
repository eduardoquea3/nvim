# Go and Rust Neovim tooling
Scope: review and configure Go/Rust formatting and diagnostics in this Neovim configuration.
Constraints: use the user-selected Rust Analyzer Clippy integration to avoid duplicate Clippy diagnostics; preserve existing behavior for other filetypes.

## Specs
1. S1: “ahora revisa si neovim esta bien configurado para go y rust , y revisa cuales son lo linters/formatter que se usan para estos dos lenguajes y configura conform y nvim-lint” — verify existing support and configure the requested formatter/linter tools.

## Tasks
- T1 [S1] Configure Go and Rust formatting/diagnostics, Rust LSP support, Mason tools, and documentation; commit one reviewable work unit.

## Log
- L1: “ahora revisa si neovim esta bien configurado para go y rust , y revisa cuales son lo linters/formatter que se usan para estos dos lenguajes y configura conform y nvim-lint”
- L2: User selected “Rust Analyzer (recomendado)”: “Rust Analyzer ejecuta Clippy; nvim-lint configura golangci-lint para Go. Sin diagnósticos duplicados.”
- L3: Read-only inventory found Go already uses `gofmt` and `gopls` with `staticcheck`, but no nvim-lint Go entry and no ensured `gofmt`; Rust had no Rust Analyzer, formatter, or linter mapping. Official current docs identify Conform `rustfmt`, nvim-lint `golangcilint`/`clippy`, and rust-analyzer `check.command = "clippy"`. Mason registry packages include `golangci-lint`, `rust-analyzer`, and `rustfmt`; Clippy is installed via the Rust toolchain.
