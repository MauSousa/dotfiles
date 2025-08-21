return {
  {
    'saghen/blink.cmp',
    -- build = 'cargo +nightly build --release',

    dependencies = {
      'rafamadriz/friendly-snippets'
    },

    version = '1.*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = 'default' },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'normal'
      },

      -- sources = {
      --   default = { "lsp", "path", "snippets", "buffer", "copilot" },
      --   providers = {
      --     copilot = {
      --       name = "copilot",
      --       module = "blink-cmp-copilot",
      --       score_offset = 100,
      --       async = true,
      --     },
      --   },
      -- },

      -- experimental signature help support
      signature = { enabled = true },
      fuzzy = { implementation = 'prefer_rust_with_warning' },
    },
  },
}
