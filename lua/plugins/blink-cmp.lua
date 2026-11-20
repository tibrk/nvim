-- Autocompletion
return {
  'saghen/blink.cmp',
  event = 'InsertEnter',
  dependencies = {
    'saghen/blink.lib',

    -- Snippet Engine & its associated blink source
    {
      'L3MON4D3/LuaSnip',
      build = (function()
        -- Build Step is needed for regex support in snippets.
        -- This step is not supported in many windows environments.
        -- Remove the below condition to re-enable on windows.
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
      dependencies = {
        -- `friendly-snippets` contains a variety of premade snippets.
        --    See the README about individual language/framework/plugin snippets:
        --    https://github.com/rafamadriz/friendly-snippets
        {
          'rafamadriz/friendly-snippets',
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
            require('luasnip.loaders.from_lua').load { paths = '~/.config/nvim/LuaSnip/' }
          end,
        },
      },
      config = function()
        local luasnip = require 'luasnip'
        luasnip.config.setup {
          -- Also load both lua and json when a markdown-file is opened,
          -- javascript for html.
          -- Other filetypes just load themselves.
          load_ft_func = require('luasnip.extras.filetype_functions').extend_load_ft {
            markdown = { 'lua', 'json' },
            html = { 'javascript' },
          },
        }
        luasnip.config.set_config {
          -- Don't store snippet history for less overhead
          history = false,
          -- Allow autotrigger snippets
          enable_autosnippets = true,
          -- For equivalent of UltiSnips visual selection
          store_selection_keys = '<Tab>',
          -- Event on which to check for exiting a snippet's region
          region_check_events = 'InsertEnter',
          delete_check_events = 'InsertLeave',
        }
      end,
    },
  },
  -- Build step downloads/builds the Rust fuzzy matcher. See `:h blink.cmp`
  build = function()
    require('blink.cmp').build():pwait()
  end,
  --- @module 'blink.cmp'
  --- @type blink.cmp.Config
  opts = {
    keymap = {
      -- preset = 'none': mirrors the previous nvim-cmp keymap exactly, so muscle
      -- memory (and the <C-h>/<C-l> split with vim-tmux-navigator in normal mode,
      -- <C-e> staying free for harpoon) keeps working unchanged.
      preset = 'none',

      -- Select the [n]ext / [p]revious item
      ['<C-n>'] = { 'select_next', 'fallback' },
      ['<C-p>'] = { 'select_prev', 'fallback' },

      -- Scroll the documentation window [b]ack / [f]orward
      ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

      -- Accept the completion. This will auto-import if your LSP supports it,
      -- and will expand snippets if the LSP sent a snippet.
      ['<Tab>'] = { 'select_and_accept', 'fallback' },

      -- Manually trigger a completion. <C-Space> is tmux's prefix key, so it
      -- won't reach Neovim with a single press there; <S-Space> is the primary
      -- trigger, <C-Space> kept as a fallback for outside tmux.
      ['<C-Space>'] = { 'show' },
      ['<S-Space>'] = { 'show' },

      -- Move to the next/previous snippet placeholder (was <C-l>/<C-h> with LuaSnip).
      ['<C-l>'] = { 'snippet_forward', 'fallback' },
      ['<C-h>'] = { 'snippet_backward', 'fallback' },
    },

    snippets = { preset = 'luasnip' },

    -- Built-in replacement for cmp-nvim-lsp-signature-help
    signature = { enabled = true },

    completion = {
      documentation = { auto_show = true },
    },

    sources = {
      default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
      providers = {
        -- make lazydev completions top priority (see `:h blink.cmp`)
        lazydev = {
          name = 'LazyDev',
          module = 'lazydev.integrations.blink',
          score_offset = 100,
        },
      },
    },
  },
}
