-- insert
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("i", "tn", "<ESC>")

-- normal
vim.keymap.set("n", "<space>h", "<cmd>noh <CR>", { desc = "Clear highlight search" })
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>", { desc = "Source file" })
vim.keymap.set("n", "<space>x", ":.lua<CR>", { desc = "Source lua config" })
vim.keymap.set("n", "gD", "<cmd>.lua vim.lsp.buf.declaration()<CR>",
  { noremap = true, silent = true, desc = "Go to declaration" })
vim.keymap.set("n", "gd", "<cmd>.lua vim.lsp.buf.definition()<CR>",
  { noremap = true, silent = true, desc = "Go to definition" })
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

-- Supermaven
vim.keymap.set("n", "<space>st", "<cmd>SupermavenStart<CR>", { desc = "Start supermaven" })
vim.keymap.set("n", "<space>ss", "<cmd>SupermavenStop<CR>", { desc = "Stop supermaven" })

-- Oil.nvim
vim.keymap.set("n", "<space>-", "<cmd>e .<CR>", { desc = "Shows oil.nvim" })

-- gitsigns
vim.keymap.set("n", "<space>gbl", "<cmd>Gitsigns blame_line<CR>", { desc = "Blame line" })

-- visual
vim.keymap.set("v", "<space>x", ":lua<CR>", { desc = "Source lua config" })

-- gentleman dots
-- Delete all buffers but the current one
vim.keymap.set("n", "<space>bq", '<Esc>:%bdelete|edit #|normal`"<CR>', {
  desc = "Delete other buffers but the current one"
}
)

vim.keymap.set("n", "<space>tc", "<cmd>CloakToggle<CR>", { desc = "Toggles cloak" })
vim.keymap.set("n", "<space>tft", "<cmd>TailwindFoldToggle<CR>", { desc = "Toggles tailwind classes" })

-- github copilot
-- vim.keymap.set('i', '<C-A>', 'copilot#Accept("\\<CR>")', {
--   expr = true,
--   replace_keycodes = false
-- })
-- vim.g.copilot_no_tab_map = true
-- vim.keymap.set('i', '<C-T>', '<Plug>(copilot-accept-word)')
-- vim.keymap.set('n', '<space>cd', '<cmd>Copilot disable<CR>', { desc = "Disable copilot" })
-- vim.keymap.set('n', '<space>ce', '<cmd>Copilot enable<CR>', { desc = "Enable copilot" })
