-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    if vim.fn.argc(-1) == 1 and vim.fn.isdirectory(vim.fn.argv(0)) ~= 0 then
      require('neo-tree').setup {
        filesystem = {
          hijack_netrw_behavior = 'open_current',
        },
      }
    end
  end,
})

vim.api.nvim_create_autocmd('BufNewFile', {
  group = vim.api.nvim_create_augroup('RemoteFile', { clear = true }),
  callback = function()
    local f = vim.fn.expand '%:p'
    for _, v in ipairs { 'sftp', 'scp', 'ssh', 'dav', 'fetch', 'ftp', 'http', 'rcp', 'rsync' } do
      local p = v .. '://'
      if string.sub(f, 1, #p) == p then
        vim.cmd [[
          unlet g:loaded_netrw
          unlet g:loaded_netrwPlugin
          runtime! plugin/netrwPlugin.vim
          silent Explore %
        ]]
        vim.api.nvim_clear_autocmds { group = 'RemoteFile' }
        break
      end
    end
  end,
})

vim.api.nvim_create_autocmd('BufEnter', {
  command = 'set rnu nu',
})

-- Enable word wrap only for prose filetypes
vim.api.nvim_create_autocmd('FileType', {
  desc = 'Enable word wrap for prose filetypes',
  group = vim.api.nvim_create_augroup('filetype_wrap', { clear = true }),
  pattern = { 'markdown', 'text', 'tex' },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
  end,
})
