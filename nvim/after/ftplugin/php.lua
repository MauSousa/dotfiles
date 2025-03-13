local set = vim.opt_local
set.shiftwidth = 4
vim.keymap.set("n", "<space>ll", "<cmd>!vendor/bin/pint -q <CR>", { desc = "Runs laravel/pint" })
