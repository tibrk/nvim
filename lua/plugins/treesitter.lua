-- Highlight, edit, and navigate code
return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').setup {
      install_dir = vim.fn.stdpath 'data' .. '/site',
    }

    -- Install parsers (no-op if already installed)
    require('nvim-treesitter').install({
      'bash', 'c', 'diff', 'html', 'lua', 'luadoc',
      'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc',
    }):wait(300000)

    -- Enable treesitter highlighting per filetype
    vim.api.nvim_create_autocmd('FileType', {
      pattern = {
        'bash', 'c', 'diff', 'html', 'lua', 'luadoc',
        'markdown', 'query', 'vim', 'vimdoc',
      },
      callback = function()
        vim.treesitter.start()
      end,
    })

    -- Treesitter-based folding (opt-in per buffer)
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'lua', 'bash', 'c', 'html', 'markdown' },
      callback = function()
        vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.wo[0][0].foldmethod = 'expr'
        vim.wo[0][0].foldenable = false -- don't fold on open
      end,
    })
  end,
}
