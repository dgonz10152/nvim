# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository

Personal Neovim configuration. Entry point is `init.lua`, which loads four modules in order: `config.lazy` (plugin manager bootstrap + leader keys), `config.style` (vim options), `config.keybinds` (global mappings), `lsp` (LSP server configs).

## Architecture

- **Plugin manager**: `lazy.nvim`, bootstrapped in `lua/config/lazy.lua`. It imports two spec groups: `plugins` (everything in `lua/plugins/*.lua`) and `plugins.lsp` (everything in `lua/plugins/lsp/*.lua`). Each plugin file returns a lazy.nvim spec table — adding a new plugin is just dropping a new file in `lua/plugins/`.
- **Leader keys**: `<space>` is leader, `\` is localleader. Set in `lua/config/lazy.lua` *before* `lazy.setup` (required by lazy.nvim).
- **LSP setup is split intentionally** across two places:
  - `lua/plugins/lsp/mason.lua` + `lua/plugins/lsp/lspconfig.lua` install servers via mason / mason-lspconfig (`ensure_installed = { "lua_ls", "pyright", "clangd" }`) and wire blink.cmp completion capabilities into `vim.lsp.config("*", ...)`.
  - `lua/lsp.lua` defines per-server configs using the new `vim.lsp.config()` / `vim.lsp.enable()` API (Neovim 0.11+), not the older `require("lspconfig").<server>.setup{}` style. When adding or modifying a server, do it here and add it to the `vim.lsp.enable({...})` call at the bottom.
- **Completion**: `blink.cmp`. The `<S-CR>` insert-mode mapping in `lua/config/keybinds.lua` accepts the selected item — this is the intended accept key, not `<CR>`.
- **Colorscheme**: catppuccin-mocha. Note `catppuccin.lua` at the repo root is **not loaded** (lazy only imports from `lua/plugins/`); the active spec is `lua/plugins/catpuccin.lua` (sic).

## Lock file

`lazy-lock.json` pins plugin commits. Commit changes to it after running `:Lazy update` / `:Lazy sync` so the lock travels with the config.

## Working on this config

- Reload by restarting Neovim, or `:source %` for the current file when iterating on vim options / keymaps.
- `:Lazy` opens the plugin manager UI; `:Mason` opens the LSP installer UI; `:checkhealth` for diagnostics.
- There is no test suite, linter, or build step.
- **After any keybind change** (add, remove, or modify a `vim.keymap.set` mapping anywhere in the config), update the corresponding table in `README.md` so the documented keybinds stay in sync with the code.
