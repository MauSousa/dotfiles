local options = {
    defaults = {
        vimgrep_arguments = {
            "rg",
            "-L",
            "--hidden",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = { "node_modules", "build", "dist", "yarn.lock", "package-lock.json", "vendor" },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "truncate" },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        mappings = {
            n = { ["q"] = require("telescope.actions").close },
        },
    },

    extensions_list = { "themes", "terms" },

    extensions = {
        extensions = {
            file_browser = {
                hidden = { file_browser = false, folder_browser = false },
                follow_symlinks = true,
                theme = "ivy",
                -- disables netrw and use telescope-file-browser in its place
                hijack_netrw = true,
                path = vim.loop.cwd(),
                cwd = vim.loop.cwd(),
                cwd_to_path = false,
                grouped = false,
                files = true,
                add_dirs = true,
                depth = 1,
                auto_depth = false,
                select_buffer = false,
                respect_gitignore = vim.fn.executable "fd" == 1,
                no_ignore = false,
                browse_files = require("telescope._extensions.file_browser.finders").browse_files,
                browse_folders = require("telescope._extensions.file_browser.finders").browse_folders,
                hide_parent_dir = false,
                collapse_dirs = false,
                prompt_path = false,
                quiet = false,
                dir_icon = "",
                dir_icon_hl = "Default",
                display_stat = { date = true, size = true, mode = true },
                use_fd = true,
                git_status = true,
                mappings = {
                    ["i"] = {
                        -- your custom insert mode mappings
                    },
                    ["n"] = {
                        -- your custom normal mode mappings
                        ["q"] = require("telescope.actions").close
                    },
                },
            },
        },
    }
}

return options
