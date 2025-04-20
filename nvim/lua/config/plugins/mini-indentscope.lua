return {
  {
    'echasnovski/mini.indentscope',
    version = false,
    event = "VeryLazy",
    config = function()
      require("mini.indentscope").setup({
        -- symbol = "▏",
        -- symbol = "│",
        -- options = { try_as_border = true },
        -- Draw options
        draw = {
          -- Delay (in ms) between event and start of drawing scope indicator
          delay = 1,

          -- Animation rule for scope's first drawing. A function which, given
          -- next and total step numbers, returns wait time (in ms). See
          -- |MiniIndentscope.gen_animation| for builtin options. To disable
          -- animation, use `require('mini.indentscope').gen_animation.none()`.
          --<function: implements constant 20ms between steps>,
          animation = require('mini.indentscope').gen_animation.none(),

          -- Whether to auto draw scope: return `true` to draw, `false` otherwise.
          -- Default draws only fully computed scope (see `options.n_lines`).
          predicate = function(scope) return not scope.body.is_incomplete end,

          -- Symbol priority. Increase to display on top of more symbols.
          priority = 2,
        },

        -- Options which control scope computation
        options = {
          -- Type of scope's border: which line(s) with smaller indent to
          -- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
          border = 'both',

          -- Whether to use cursor column when computing reference indent.
          -- Useful to see incremental scopes with horizontal cursor movements.
          -- indent_at_cursor = true,
          indent_at_cursor = false,

          -- Maximum number of lines above or below within which scope is computed
          n_lines = 10000,

          -- Whether to first check input line to be a border of adjacent scope.
          -- Use it if you want to place cursor on function header to get scope of
          -- its body.
          try_as_border = true,
        },

        -- Which character to use for drawing scope indicator
        -- symbol = '╎',
        symbol = "│",
      })
    end,
  }
}
