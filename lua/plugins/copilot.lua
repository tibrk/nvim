return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function()
    require('copilot').setup {
      filetypes = {
        javascript = true, -- allow specific filetype
        typescript = true, -- allow specific filetype
        python = true,
        yaml = true,
        lua = true,
        ['*'] = false, -- disable for all other filetypes and ignore default `filetypes`
      },
    }
  end,
}
