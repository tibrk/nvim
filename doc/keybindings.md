# Neovim Keybindings Reference

This document provides a comprehensive overview of all keybindings configured in this Neovim setup, organized by category.

## Table of Contents

- [File Navigation](#file-navigation)
- [Code Intelligence](#code-intelligence)
- [Editing and Formatting](#editing-and-formatting)
- [Git Integration](#git-integration)
- [Search and Find](#search-and-find)
- [Debugging](#debugging)
- [Miscellaneous Tools](#miscellaneous-tools)

## File Navigation

### Telescope File Navigation
| Keybinding | Description |
|------------|-------------|
| `<leader>sf` | Search Files |
| `<leader>s.` | Search Recent Files |
| `<leader><leader>` | Find existing buffers |
| `<leader>sn` | Search Neovim files |

### Harpoon File Navigation
| Keybinding | Description |
|------------|-------------|
| `<leader>a` | Add file to harpoon |
| `<leader>r` | Remove file from harpoon |
| `<C-S-P>` | Navigate to previous file in harpoon |
| `<C-S-N>` | Navigate to next file in harpoon |
| `<C-e>` | Open harpoon window |

### File Explorer
| Keybinding | Description |
|------------|-------------|
| `\` | Toggle Neo-tree file explorer |

## Code Intelligence

### LSP Navigation
| Keybinding | Description |
|------------|-------------|
| `gd` | Go to Definition |
| `gr` | Go to References |
| `gI` | Go to Implementation |
| `<leader>D` | Type Definition |
| `gD` | Go to Declaration |

### LSP Features
| Keybinding | Description |
|------------|-------------|
| `<leader>ds` | Document Symbols |
| `<leader>ws` | Workspace Symbols |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code Action (normal and visual modes) |
| `<leader>th` | Toggle Inlay Hints |

## Editing and Formatting

### Code Formatting
| Keybinding | Description |
|------------|-------------|
| `<leader>f` | Format buffer (normal and visual modes) |

### Completion and Snippets
| Keybinding | Description | Mode |
|------------|-------------|------|
| `<C-n>` | Select next item | Insert |
| `<C-p>` | Select previous item | Insert |
| `<C-b>` | Scroll docs backward | Insert |
| `<C-f>` | Scroll docs forward | Insert |
| `<Tab>` | Confirm selection | Insert |
| `<C-Space>` | Trigger completion | Insert |
| `<C-l>` | Expand snippet or jump forward | Insert |
| `<C-h>` | Jump backward in snippet | Insert |

## Git Integration

### Navigation
| Keybinding | Description |
|------------|-------------|
| `]c` | Jump to next git change |
| `[c` | Jump to previous git change |

### Hunk Management
| Keybinding | Description |
|------------|-------------|
| `<leader>hs` | Stage hunk (normal and visual modes) |
| `<leader>hr` | Reset hunk (normal and visual modes) |
| `<leader>hS` | Stage buffer |
| `<leader>hu` | Undo stage hunk |
| `<leader>hR` | Reset buffer |
| `<leader>hp` | Preview hunk |

### Git Information
| Keybinding | Description |
|------------|-------------|
| `<leader>hb` | Blame line |
| `<leader>hd` | Diff against index |
| `<leader>hD` | Diff against last commit |
| `<leader>tb` | Toggle current line blame |
| `<leader>tD` | Toggle preview hunk inline |

## Search and Find

### Telescope Search
| Keybinding | Description |
|------------|-------------|
| `<leader>sh` | Search Help tags |
| `<leader>sk` | Search Keymaps |
| `<leader>ss` | Search Select Telescope |
| `<leader>sw` | Search current Word |
| `<leader>sg` | Search by Grep |
| `<leader>sd` | Search Diagnostics |
| `<leader>sr` | Search Resume |
| `<leader>/` | Fuzzy find in current buffer |
| `<leader>s/` | Search in open files |

## Debugging

### Debug Controls
| Keybinding | Description |
|------------|-------------|
| `<F5>` | Debug: Start/Continue |
| `<F11>` | Debug: Step Into |
| `<F10>` | Debug: Step Over |
| `<F12>` | Debug: Step Out |
| `<F7>` | Toggle debug UI |

### Breakpoints
| Keybinding | Description |
|------------|-------------|
| `<leader>b` | Toggle Breakpoint |
| `<leader>w` | Add watch expression |
| `<leader>B` | Set conditional breakpoint |

## Miscellaneous Tools

### Undotree
| Keybinding | Description |
|------------|-------------|
| `<leader>u` | Toggle Undotree |

---

**Note**: `<leader>` key is typically mapped to the spacebar unless configured otherwise.

