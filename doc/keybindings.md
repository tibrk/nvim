# Neovim Keybindings Reference

This document provides a comprehensive overview of all keybindings configured in this Neovim setup, organized by category.

**Leader key**: `<Space>`

## Table of Contents

- [General](#general)
- [Clipboard and Registers](#clipboard-and-registers)
- [Movement and Navigation](#movement-and-navigation)
- [Window and Tmux Navigation](#window-and-tmux-navigation)
- [File Navigation](#file-navigation)
- [Search and Find](#search-and-find)
- [Code Intelligence (LSP)](#code-intelligence-lsp)
- [Editing and Formatting](#editing-and-formatting)
- [Git Integration](#git-integration)
- [Debugging](#debugging)
- [Miscellaneous Tools](#miscellaneous-tools)

## General

| Keybinding | Mode | Description | Source |
|------------|------|-------------|--------|
| `<Esc>` | Normal | Clear search highlights | remap.lua |
| `<Esc><Esc>` | Terminal | Exit terminal mode | remap.lua |
| `Q` | Normal | Disabled (no-op) | remap.lua |
| `<leader>q` | Normal | Open diagnostic quickfix list | remap.lua |
| `<leader>pv` | Normal | Open netrw file explorer | remap.lua |
| `<leader>s` | Normal | Search and replace word under cursor | remap.lua |
| `<leader>x` | Normal | Make current file executable | remap.lua |
| `<Leader>ü` | All | Reload LuaSnip snippets | remap.lua |

## Clipboard and Registers

| Keybinding | Mode | Description | Source |
|------------|------|-------------|--------|
| `<leader>y` | Normal, Visual | Yank to system clipboard | remap.lua |
| `<leader>Y` | Normal | Yank line to system clipboard | remap.lua |
| `<leader>p` | Visual | Paste over selection without yanking it | remap.lua |
| `<leader>d` | Normal, Visual | Delete to black hole register | remap.lua |

## Movement and Navigation

| Keybinding | Mode | Description | Source |
|------------|------|-------------|--------|
| `J` | Visual | Move selected lines down | remap.lua |
| `K` | Visual | Move selected lines up | remap.lua |
| `<C-k>` | Normal | Next quickfix item (centered) | remap.lua |
| `<C-j>` | Normal | Previous quickfix item (centered) | remap.lua |
| `<leader>k` | Normal | Next location list item (centered) | remap.lua |
| `<leader>j` | Normal | Previous location list item (centered) | remap.lua |

## Window and Tmux Navigation

These keybindings navigate between Neovim splits and Tmux panes seamlessly.

| Keybinding | Mode | Description | Source |
|------------|------|-------------|--------|
| `<C-h>` | Normal | Navigate left (window/tmux pane) | vim-tmux-navigator.lua |
| `<C-j>` | Normal | Navigate down (window/tmux pane) | vim-tmux-navigator.lua |
| `<C-k>` | Normal | Navigate up (window/tmux pane) | vim-tmux-navigator.lua |
| `<C-l>` | Normal | Navigate right (window/tmux pane) | vim-tmux-navigator.lua |
| `<C-\>` | Normal | Navigate to previous tmux pane | vim-tmux-navigator.lua |

## File Navigation

### Telescope

| Keybinding | Mode | Description | Source |
|------------|------|-------------|--------|
| `<leader>sf` | Normal | Search files | telescope.lua |
| `<leader>s.` | Normal | Search recent files | telescope.lua |
| `<leader><leader>` | Normal | Find existing buffers | telescope.lua |
| `<leader>sn` | Normal | Search Neovim config files | telescope.lua |

### Harpoon

| Keybinding | Mode | Description | Source |
|------------|------|-------------|--------|
| `<leader>a` | Normal | Add file to Harpoon list | harpoon.lua |
| `<leader>r` | Normal | Remove file from Harpoon list | harpoon.lua |
| `<C-S-P>` | Normal | Navigate to previous Harpoon buffer | harpoon.lua |
| `<C-S-N>` | Normal | Navigate to next Harpoon buffer | harpoon.lua |
| `<C-e>` | Normal | Open Harpoon window (via Telescope) | harpoon.lua |

### Neo-tree

| Keybinding | Mode | Description | Source |
|------------|------|-------------|--------|
| `<leader>e` | Normal | Toggle Neo-tree file explorer | neo-tree.lua |

**Neo-tree window-local keybindings** (active only inside the Neo-tree panel):

| Keybinding | Description | Source |
|------------|-------------|--------|
| `l` | Open file or directory | neo-tree.lua |
| `h` | Close node | neo-tree.lua |
| `<Space>` | Disabled (prevents leader conflict) | neo-tree.lua |
| `Y` | Copy file path to system clipboard | neo-tree.lua |
| `O` | Open with system application | neo-tree.lua |
| `P` | Toggle preview | neo-tree.lua |

## Search and Find

### Telescope Search

| Keybinding | Mode | Description | Source |
|------------|------|-------------|--------|
| `<leader>sh` | Normal | Search help tags | telescope.lua |
| `<leader>sk` | Normal | Search keymaps | telescope.lua |
| `<leader>ss` | Normal | Search select Telescope builtin | telescope.lua |
| `<leader>sw` | Normal | Search current word | telescope.lua |
| `<leader>sg` | Normal | Search by grep | telescope.lua |
| `<leader>sd` | Normal | Search diagnostics | telescope.lua |
| `<leader>sr` | Normal | Search resume (reopen last search) | telescope.lua |
| `<leader>/` | Normal | Fuzzy find in current buffer | telescope.lua |
| `<leader>s/` | Normal | Search (grep) in open files | telescope.lua |

## Code Intelligence (LSP)

### LSP Navigation

| Keybinding | Mode | Description | Source |
|------------|------|-------------|--------|
| `gd` | Normal | Go to definition | lsp.lua |
| `gr` | Normal | Go to references | lsp.lua |
| `gI` | Normal | Go to implementation | lsp.lua |
| `gD` | Normal | Go to declaration | lsp.lua |
| `<leader>D` | Normal | Type definition | lsp.lua |

### LSP Features

| Keybinding | Mode | Description | Source |
|------------|------|-------------|--------|
| `<leader>ds` | Normal | Document symbols | lsp.lua |
| `<leader>ws` | Normal | Workspace symbols | lsp.lua |
| `<leader>rn` | Normal | Rename symbol | lsp.lua |
| `<leader>ca` | Normal, Visual | Code action | lsp.lua |
| `<leader>th` | Normal | Toggle inlay hints | lsp.lua |

## Editing and Formatting

### Code Formatting

| Keybinding | Mode | Description | Source |
|------------|------|-------------|--------|
| `<leader>f` | All | Format buffer (async, LSP fallback) | conform.lua |

### Completion and Snippets

| Keybinding | Mode | Description | Source |
|------------|------|-------------|--------|
| `<C-n>` | Insert | Select next completion item | nvim-cmp.lua |
| `<C-p>` | Insert | Select previous completion item | nvim-cmp.lua |
| `<C-b>` | Insert | Scroll docs backward | nvim-cmp.lua |
| `<C-f>` | Insert | Scroll docs forward | nvim-cmp.lua |
| `<Tab>` | Insert | Confirm completion selection | nvim-cmp.lua |
| `<C-Space>` | Insert | Trigger completion manually | nvim-cmp.lua |
| `<C-l>` | Insert, Select | Expand snippet or jump forward | nvim-cmp.lua |
| `<C-h>` | Insert, Select | Jump backward in snippet | nvim-cmp.lua |

## Git Integration

### Navigation

| Keybinding | Mode | Description | Source |
|------------|------|-------------|--------|
| `]c` | Normal | Jump to next git change | gitsigns.lua |
| `[c` | Normal | Jump to previous git change | gitsigns.lua |

### Hunk Management

| Keybinding | Mode | Description | Source |
|------------|------|-------------|--------|
| `<leader>hs` | Normal, Visual | Stage hunk | gitsigns.lua |
| `<leader>hr` | Normal, Visual | Reset hunk | gitsigns.lua |
| `<leader>hS` | Normal | Stage entire buffer | gitsigns.lua |
| `<leader>hu` | Normal | Undo stage hunk | gitsigns.lua |
| `<leader>hR` | Normal | Reset entire buffer | gitsigns.lua |
| `<leader>hp` | Normal | Preview hunk | gitsigns.lua |

### Git Information

| Keybinding | Mode | Description | Source |
|------------|------|-------------|--------|
| `<leader>hb` | Normal | Blame current line | gitsigns.lua |
| `<leader>hd` | Normal | Diff against index | gitsigns.lua |
| `<leader>hD` | Normal | Diff against last commit | gitsigns.lua |
| `<leader>tb` | Normal | Toggle current line blame | gitsigns.lua |
| `<leader>tD` | Normal | Toggle deleted lines inline preview | gitsigns.lua |

## Debugging

### Debug Controls

| Keybinding | Mode | Description | Source |
|------------|------|-------------|--------|
| `<F5>` | Normal | Start / Continue | debug.lua |
| `<F11>` | Normal | Step into | debug.lua |
| `<F10>` | Normal | Step over | debug.lua |
| `<F12>` | Normal | Step out | debug.lua |
| `<F7>` | Normal | Toggle DAP UI | debug.lua |

### Breakpoints

| Keybinding | Mode | Description | Source |
|------------|------|-------------|--------|
| `<leader>b` | Normal | Toggle breakpoint | debug.lua |
| `<leader>B` | Normal | Set conditional breakpoint | debug.lua |
| `<leader>w` | Normal | Add word under cursor to watches | debug.lua |

## Miscellaneous Tools

### Undotree

| Keybinding | Mode | Description | Source |
|------------|------|-------------|--------|
| `<leader>u` | Normal | Toggle Undotree | undotree.lua |
