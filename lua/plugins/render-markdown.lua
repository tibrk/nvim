return {
  'MeanderingProgrammer/render-markdown.nvim',
  ft = { 'markdown' },
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    heading = {
      enabled = true,
      -- Use a distinct background per heading level
      backgrounds = {
        'RenderMarkdownH1Bg',
        'RenderMarkdownH2Bg',
        'RenderMarkdownH3Bg',
        'RenderMarkdownH4Bg',
        'RenderMarkdownH5Bg',
        'RenderMarkdownH6Bg',
      },
      foregrounds = {
        'RenderMarkdownH1',
        'RenderMarkdownH2',
        'RenderMarkdownH3',
        'RenderMarkdownH4',
        'RenderMarkdownH5',
        'RenderMarkdownH6',
      },
    },
    code = {
      enabled = true,
      -- Show a block background behind fenced code blocks
      style = 'full',
    },
    bullet = {
      enabled = true,
      icons = { '●', '○', '◆', '◇' },
    },
    checkbox = {
      enabled = true,
      unchecked = { icon = '☐' },
      checked = { icon = '☑' },
    },
    table = {
      enabled = true,
    },
    dash = {
      enabled = true,
    },
  },
  keys = {
    { '<leader>mr', '<cmd>RenderMarkdown toggle<cr>', ft = 'markdown', desc = '[M]arkdown [R]ender toggle' },
  },
}
