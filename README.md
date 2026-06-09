# Neovim Config

Personal Neovim configuration. Entry point is `init.lua`, which loads `config.lazy`, `config.style`, `config.keybinds`, and `lsp` in order.

- **Leader:** `<Space>`
- **Local leader:** `\`
- **Plugin manager:** [lazy.nvim](https://github.com/folke/lazy.nvim)
- **Colorscheme:** catppuccin-mocha

## Keybinds

### General

| Key | Mode | Action |
| --- | --- | --- |
| `<leader>e` | n | Open Oil file explorer |
| `<leader>ff` | n | Telescope find files |

### Completion (blink.cmp)

| Key | Mode | Action |
| --- | --- | --- |
| `<Tab>` | i | Accept selected completion (fallback otherwise) |
| `<S-CR>` | i | Accept selected completion |
| `<S-Tab>` | i | Fallback |
| `<C-y>` | i | Disabled |

### Harpoon

| Key | Mode | Action |
| --- | --- | --- |
| `<leader>A` | n | Add current file to harpoon list |
| `<leader>h` | n | Toggle harpoon quick menu |
| `<leader>1`–`<leader>4` | n | Jump to harpoon file 1–4 |
| `<leader>p` | n | Previous harpoon file |
| `<leader>n` | n | Next harpoon file |

### Diffview

| Key | Mode | Action |
| --- | --- | --- |
| `<leader>hh` | n | Toggle Diffview open/close |

### Folding (treesitter)

| Key | Mode | Action |
| --- | --- | --- |
| `za` | n | Toggle fold under cursor |
| `zo` / `zc` | n | Open / close fold |
| `zR` | n | Open all folds |
| `zM` | n | Close all folds |

### Diagnostics

| Key | Mode | Action |
| --- | --- | --- |
| `]d` | n | Next diagnostic |
| `[d` | n | Previous diagnostic |
| `<leader>d` | n | Show diagnostic float |
| `<leader>q` | n | Send diagnostics to loclist |

### LSP (Lspsaga)

| Key | Mode | Action |
| --- | --- | --- |
| `K` | n | Hover docs |
| `gd` | n | Peek definition |
| `gD` | n | Go to definition |
| `gr` | n | LSP finder (refs / impls) |
| `<leader>ca` | n | Code action |
| `<leader>rn` | n | Rename symbol |
| `<leader>o` | n | Symbol outline |

### Claude Code

Claude Code runs in a separate tmux pane; Neovim hosts the WebSocket bridge (auto-discovered via `~/.claude/ide/<port>.lock`).

| Key | Mode | Action |
| --- | --- | --- |
| `<leader>ab` | n | Add current buffer to context |
| `<leader>as` | v | Send selection to Claude |
| `<leader>as` | n | Add file from tree (oil / nvim-tree / neo-tree / minifiles / netrw) |
| `<leader>aa` | n | Accept diff |
| `<leader>ad` | n | Deny diff |

## Plugins

### UI / Theme

- **[catppuccin/nvim](https://github.com/catppuccin/nvim)** — colorscheme (catppuccin-mocha is active; configured with integrations for treesitter, lsp, telescope, bufferline, mason, mini, blink, alpha).
- **[alpha-nvim](https://github.com/goolord/alpha-nvim)** — startup dashboard (startify theme, with fortune footer).
- **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)** — statusline with a custom catppuccin theme and a Claude Code connection indicator.

### Editing

- **[blink.cmp](https://github.com/saghen/blink.cmp)** — completion engine. Sources: lsp, path, snippets, buffer. Friendly-snippets bundled in.
- **[mini.pairs](https://github.com/nvim-mini/mini.pairs)** — autopairs for brackets/quotes, with markdown-aware behavior.
- **[ts-comments.nvim](https://github.com/folke/ts-comments.nvim)** — Tree-sitter-aware `commentstring`.
- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** — syntax / indent. `ensure_installed`: html, bash, python. Also registers `.env*` files as `sh`.

### Navigation

- **[oil.nvim](https://github.com/stevearc/oil.nvim)** — buffer-style file explorer, set as the default file explorer (hidden files shown, `.git` hidden, delete-to-trash).
- **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)** — fuzzy finder. `find_files` includes hidden + ignored files; node_modules / `.git` / `.next` / `.node` / `.DS_Store` excluded.
- **[harpoon](https://github.com/ThePrimeagen/harpoon)** (branch `harpoon2`) — pin a small set of files and jump between them with `<leader>1`–`<leader>4`.

### LSP

- **[mason.nvim](https://github.com/mason-org/mason.nvim)** — LSP/tool installer.
- **[mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)** — bridges mason and lspconfig. `ensure_installed`: `lua_ls`, `pyright`, `clangd`.
- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)** — wires blink.cmp completion capabilities into `vim.lsp.config("*", ...)`. Per-server configs live in `lua/lsp.lua` using the `vim.lsp.config()` / `vim.lsp.enable()` API (Neovim 0.11+).
- **[lspsaga.nvim](https://github.com/nvimdev/lspsaga.nvim)** — prettier LSP UI (hover, peek, finder, code actions, rename, outline, winbar symbols).
- **[lazydev.nvim](https://github.com/folke/lazydev.nvim)** — Lua LSP that knows about Neovim, lazy.nvim, snacks, and luv when editing this config.

### Tools / Misc

- **[claudecode.nvim](https://github.com/coder/claudecode.nvim)** — Claude Code WebSocket bridge. Auto-starts so the CLI (run from a separate tmux pane) can connect; vertical diff layout for in-nvim diff review.
- **[snacks.nvim](https://github.com/folke/snacks.nvim)** — Folke's utility library; used here for terminal + input UI (and as a dep of claudecode).
- **[leetcode.nvim](https://github.com/kawre/leetcode.nvim)** — LeetCode inside Neovim.

## Useful commands

- `:Lazy` — plugin manager UI
- `:Mason` — LSP/tool installer UI
- `:checkhealth` — diagnostics
- `:Lazy update` / `:Lazy sync` — refresh plugins (commit `lazy-lock.json` afterwards)
