-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim
return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  init = function()
    if vim.fn.argc(-1) == 1 then
      local arg = vim.fn.argv(0)
      -- Check if arg is a string before passing to fs_stat
      if type(arg) == 'string' then
        local stat = vim.uv.fs_stat(arg)
        if stat and stat.type == 'directory' then
          require('neo-tree').setup {
            filesystem = {
              hijack_netrw_behavior = 'open_default',
            },
          }
        end
      end
    end
  end,
  keys = {
    { '\\\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\\\'] = 'close_window',
        },
      },
    },
  },
}
