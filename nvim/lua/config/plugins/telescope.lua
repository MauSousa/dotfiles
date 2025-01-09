-- plugins/telescope.lua:
return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<space>ff', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<space>fa', "<cmd>Telescope find_files follow=true no_ignore=true hidden=true <CR>",
        { desc = 'Telescope find all files' })
      vim.keymap.set('n', '<space>fg', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<space>fb', builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<space>fh', builtin.help_tags, { desc = 'Telescope help tags' })
      vim.keymap.set('n', '<space>en', function()
          require('telescope.builtin').find_files {
            cwd = vim.fn.stdpath("config")
          }
        end,
        {
          desc = 'Neovim config'
        }
      )
    end
  }
}
