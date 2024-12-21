-- local opts = { noremap = true, silent = true }
-- local term_opts = { silent = true }
-- local keymap = vim.api.nvim_set_keymap
--
-- keymap("", "<Space>", "<Nop>", opts)
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

-- keymap("i", "jk", "<ESC>", opts)

-- Modes
-- i -> insert
-- n -> normal
-- v -> visual

-- insert
vim.keymap.set("i", "jk", "<ESC>")

-- normal
vim.keymap.set("n", "<space>h", "<cmd>noh <CR>")
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")

-- visual
vim.keymap.set("v", "<space>x", ":lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")
