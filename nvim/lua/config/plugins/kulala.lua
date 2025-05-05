return {
  {
    "mistweaverco/kulala.nvim",
    enabled = false,
    keys = {
      { "<leader>Ss", desc = "Send request" },
      { "<leader>Sa", desc = "Send all requests" },
      { "<leader>Sb", desc = "Open scratchpad" },
    },
    ft = { "http", "rest" },
    opts = {
      -- your configuration comes here
      global_keymaps = false,
    },
  },
}
