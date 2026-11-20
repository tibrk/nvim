# Config Overview (as of 2026-10-11)

A snapshot of this Neovim config: what's installed, what's healthy, what's
stale, and what's worth adding. Based on `kickstart.nvim`, managed by
`lazy.nvim`, running on **Neovim v0.12.5**.

## Plugin inventory

| Area | Plugin | Status |
|---|---|---|
| Plugin manager | `folke/lazy.nvim` | current |
| Completion | `hrsh7th/nvim-cmp` + `cmp-nvim-lsp`, `cmp-path`, `cmp-nvim-lsp-signature-help` | maintenance mode (see below) |
| Snippets | `L3MON4D3/LuaSnip` + `rafamadriz/friendly-snippets` | current, standard choice |
| LSP core | `neovim/nvim-lspconfig` | current, uses native `vim.lsp.config` (0.11+) — already modern |
| LSP install | `williamboman/mason.nvim`, `mason-lspconfig.nvim`, `mason-tool-installer.nvim` | current |
| Java LSP | `nvim-java/nvim-java`, `jdtls` | current (recently reworked per git log) |
| LSP status | `j-hui/fidget.nvim` | current |
| Treesitter | `nvim-treesitter/nvim-treesitter` (`main` branch, new Lua API) | current, on the modern rewrite |
| Lua dev | `folke/lazydev.nvim` | current |
| Formatting | `stevearc/conform.nvim` | current, **one config bug found** (below) |
| Linting | `mfussenegger/nvim-lint` | current |
| Debugging | `mfussenegger/nvim-dap`, `nvim-dap-ui`, `nvim-dap-go`, `nvim-dap-vscode-js`, `mason-nvim-dap`, `nvim-nio` | current |
| Fuzzy finder | `nvim-telescope/telescope.nvim` + `telescope-fzf-native`, `telescope-ui-select` | current, actively maintained |
| File tree | `nvim-neo-tree/neo-tree.nvim` | current |
| File nav | `ThePrimeagen/harpoon` (branch `harpoon2`) | current |
| Git | `lewis6991/gitsigns.nvim` | current |
| Jupyter | `ajbucci/ipynb.nvim` | new addition, untracked in git — see below |
| Markdown | `MeanderingProgrammer/render-markdown.nvim`, `iamcco/markdown-preview.nvim` | current / low-activity upstream (below) |
| Indent guides | `lukas-reineke/indent-blankline.nvim` (`ibl`) | current, but see Snacks note below |
| Statusline/UI bits | `echasnovski/mini.nvim` (`mini.ai`, `mini.surround`, `mini.statusline`) | current |
| Theme | `folke/tokyonight.nvim` | current |
| Todo comments | `folke/todo-comments.nvim` | current |
| Undo | `mbbill/undotree` | current, mature/slow-moving, no issues |
| Todo list | `atiladefreitas/dooing` | small single-maintainer project, works fine |
| Tmux nav | `christoomey/vim-tmux-navigator` | current |
| LaTeX | `lervag/vimtex` (pinned `v2.15`) | current |

## Issues found (fixed)

1. ~~**Duplicate plugin spec**~~ — `lua/plugins/vim-tmux.lua` (the one with
   the invalid `<C-(>` mapping) was deleted; `vim-tmux-navigator.lua` is now
   the single source of truth for those keybindings.

2. ~~**Formatter/linter mix-up in `conform.lua`**~~ — `sh`/`bash`/`zsh` now
   use `shfmt` as the conform formatter; `shellcheck` was moved to
   `nvim-lint`'s `linters_by_ft` where it belongs. `shfmt` was added to
   Mason's `ensure_installed` list in `lsp.lua`.

3. ~~**`avante.lua` dead file**~~ — deleted (was fully commented out / unused).

4. ~~**`snacks.nvim` dependency**~~ — removed from `ipynb.lua`; it was only
   pulled in as an optional inline-image dependency and wasn't otherwise
   used. Run `:Lazy clean` to actually remove it from disk and have
   `lazy-lock.json` drop the entry.

5. **Uncommitted state** — `lazy-lock.json` has pending version bumps and
   `lua/plugins/ipynb.lua` is new/untracked. Worth committing once you're
   happy with where things land.

## What's already up to date (no action needed)

- LSP config already uses the **native `vim.lsp.config`/`vim.lsp.enable`**
  API introduced in Neovim 0.11 — this is the current recommended approach,
  not the older `require('lspconfig').setup{}` pattern.
- `nvim-treesitter` is already on the **`main` branch** (the new, faster
  Lua-based rewrite), not the legacy `master` branch.
- Nothing in the config calls deprecated APIs for Neovim 0.12.5.

## New / well-trusted tools worth considering

- **`saghen/blink.cmp`** — drop-in replacement for `nvim-cmp`. Written in
  Lua with a Rust fuzzy-matcher, materially faster, and has overtaken
  `nvim-cmp` as the default completion engine in most actively-maintained
  starter configs (nvim-cmp itself has slowed to near-maintenance-only).
  Would replace `nvim-cmp.lua` entirely; LuaSnip can stay.
- **`astral-sh/ruff`** (via `mason`) — a single fast tool that replaces
  `black` + `isort` + `pylint` for Python. Would simplify `conform.lua` and
  `lint.lua` considerably and is now the de facto standard in the Python
  tooling ecosystem.
- **`mason-org/mason.nvim`** — note the GitHub org for `mason.nvim`,
  `mason-lspconfig.nvim`, etc. moved from `williamboman/*` to `mason-org/*`
  in 2024. The `williamboman/*` repos are archived forwards and still work,
  but new installs/docs point at `mason-org/*` — worth updating the plugin
  source URLs next time you touch `lsp.lua`/`debug.lua`.

## Suggested next steps

1. Run `:Lazy clean` to uninstall `avante.nvim`/`snacks.nvim` from disk and
   refresh `lazy-lock.json`.
2. Commit the pending `lazy-lock.json` bump and the new `ipynb.lua`.
3. Optionally trial `blink.cmp` and/or `ruff` as described above.
