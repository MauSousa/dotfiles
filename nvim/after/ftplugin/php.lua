local set = vim.opt_local
set.shiftwidth = 4
vim.keymap.set("n", "<space>ll", "<cmd>!vendor/bin/pint -q <CR>", { desc = "Runs laravel/pint" })
vim.keymap.set(
  'n',
  '<leader>rta',
  function() require('neotest').run.run("tests") end,
  { desc = "Run all tests" }
)
vim.keymap.set(
  'n',
  '<leader>rcf',
  function() require('neotest').run.run() end,
  { desc = "Run the current test file" }
)
vim.keymap.set(
  'n',
  '<leader>rtf',
  function() require('neotest').run.run(vim.fn.expand('%')) end,
  { desc = "Expand the test?" }
)
-- vim.keymap.set('n', '<leader>tl', function() require('neotest').run.run_last() end)
-- vim.keymap.set('n', '<leader>te', function() require('neotest').run.stop() end)
vim.keymap.set(
  'n',
  '<leader>ra',
  function() require('neotest').run.attach() end,
  { desc = "Attach to running test" }
)
vim.keymap.set(
  'n',
  '<leader>rw',
  function() require('neotest').watch.watch("tests") end,
  { desc = "Expand a watch buffer" }
)
vim.keymap.set(
  'n',
  '<leader>rop',
  function() require("neotest").output.open({ enter = true }) end,
  { desc = "Open output panel" }
)
vim.keymap.set('n',
  '<leader>rot',
  function() require('neotest').output_panel.toggle() end,
  { desc = "Toggle output panel" }
)
vim.keymap.set(
  'n',
  '<leader>rst',
  function() require('neotest').summary.toggle() end,
  { desc = "Toggle summary" }
)
