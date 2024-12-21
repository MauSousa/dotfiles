return {
  {
    'saghen/blink.cmp',

    dependencies = 'rafamadriz/friendly-snippets',

    version = 'v0.7.6',

    opts = {
      keymap = { preset = 'default' },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'normal'
      },

      -- experimental signature help support
      signature = { enabled = true }
    },
  },
}
