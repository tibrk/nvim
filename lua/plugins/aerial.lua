return {
  'stevearc/aerial.nvim',
  -- Load on file open so the { / } on_attach keymaps exist before the first toggle
  event = { 'BufReadPost', 'BufNewFile' },
  opts = {
    on_attach = function(bufnr)
      -- Jump between symbols (replaces paragraph motions in buffers aerial attaches to)
      vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr, desc = 'Aerial: previous symbol' })
      vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr, desc = 'Aerial: next symbol' })
    end,
  },
  keys = {
    { '<leader>o', '<cmd>AerialToggle!<CR>', desc = 'Toggle [O]utline (aerial)' },
  },
  -- Optional dependencies
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
}
