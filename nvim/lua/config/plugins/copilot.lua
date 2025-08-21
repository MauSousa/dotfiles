return {
  -- {
  --   "github/copilot.vim",
  --   enabled = false,
  -- }
  {
    "zbirenbaum/copilot.lua",
    enabled = false,
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },
  {
    "giuxtaposition/blink-cmp-copilot",
    dependencies = { "zbirenbaum/copilot.lua" },
  }
}
