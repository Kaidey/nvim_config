return {
  {
    -- Autocompletion
    'saghen/blink.cmp',
    version = "1.*",
    event = 'VimEnter',
    dependencies = {
      -- Snippet Engine
      {
        'L3MON4D3/LuaSnip',
        version = "2.*",
        build = 'make install_jsregexp',
        dependencies = {
           {
             'rafamadriz/friendly-snippets',
             config = function()
               require('luasnip.loaders.from_vscode').lazy_load()
             end,
           },
        },
        opts = {},
      },
    },
    opts = {
      keymap = {
        preset = 'default',
      },

      appearance = {
        nerd_font_variant = 'mono',
      },

      completion = {
        documentation = { auto_show = false, auto_show_delay_ms = 500 },
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'lazydev'},
        providers = {
          lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
        },
      },

      snippets = { preset = 'luasnip' },
      fuzzy = { implementation = 'lua' },
      signature = { enabled = true },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
