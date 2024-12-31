-- insert
vim.keymap.set("i", "jk", "<ESC>")

-- normal
vim.keymap.set("n", "<space>h", "<cmd>noh <CR>", { desc = "Clear highlight search" })
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>", { desc = "Source file" })
vim.keymap.set("n", "<space>x", ":.lua<CR>", { desc = "Source lua config" })
vim.keymap.set("n", "gD", "<cmd>.lua vim.lsp.buf.declaration()<CR>",
  { noremap = true, silent = true, desc = "Go to declaration" })
vim.keymap.set("n", "gd", "<cmd>.lua vim.lsp.buf.definition()<CR>",
  { noremap = true, silent = true, desc = "Go to definition" })
vim.keymap.set("n", "<space>ll", "<cmd>!vendor/bin/pint -q <CR>", { desc = "Runs laravel/pint" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true, desc = "Window left" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true, desc = "Window right" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true, desc = "Window up" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true, desc = "Window down" })
vim.keymap.set("n", "<space>cb", "<cmd>close<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Go to next buffer" })
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Go to previous buffer" })
vim.keymap.set("n", "<space>od", function()
  vim.diagnostic.open_float({ border = "rounded" })
end, { desc = "Floating diagnostic" })
vim.keymap.set("n", "<C-c>", "<cmd> %y+ <CR>", { desc = "Copy whole file" })
vim.keymap.set("n", "<C-s", "<cmd>w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<space>bd", "<cmd>bd<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<space>st", "<cmd>SupermavenStart<CR>", { desc = "Start supermaven" })
vim.keymap.set("n", "<space>ss", "<cmd>SupermavenStop<CR>", { desc = "Stop supermaven" })

-- visual
vim.keymap.set("v", "<space>x", ":lua<CR>", { desc = "Source lua config" })
