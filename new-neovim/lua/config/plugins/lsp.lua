return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      'saghen/blink.cmp',
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only loads on lua files
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local util = require("lspconfig/util")

      -- lua
      require("lspconfig").lua_ls.setup { capabilites = capabilities }

      -- php
      require("lspconfig").intelephense.setup {
        capabilities = capabilities,
        cmd = { "intelephense", "--stdio" },
        filetypes = { "php" },
        root_dir = util.root_pattern("composer.json", ".git"),
      }

      -- tailwindcss
      require("lspconfig").tailwindcss.setup {
        capabilities = capabilities,
        cmd = { "tailwindcss-language-server", "--stdio" },
        filetypes = { "aspnetcorerazor",
          "astro",
          "astro-markdown",
          "blade", "clojure",
          "django-html",
          "htmldjango",
          "edge",
          "eelixir",
          "elixir",
          "ejs",
          "erb",
          "eruby",
          "gohtml",
          "gohtmltmpl",
          "haml",
          "handlebars",
          "hbs",
          "html",
          "htmlangular",
          "html-eex",
          "heex",
          "jade",
          "leaf",
          "liquid",
          "markdown",
          "mdx",
          "mustache",
          "njk",
          "nunjucks",
          "php",
          "razor",
          "slim",
          "twig",
          "css",
          "less",
          "postcss",
          "sass",
          "scss",
          "stylus",
          "sugarss",
          "javascript",
          "javascriptreact",
          "reason",
          "rescript",
          "typescript",
          "typescriptreact",
          "vue",
          "svelte",
          "templ"
        },
        settings = {
          tailwindCSS = {
            classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
            includeLanguages = {
              eelixir = "html-eex",
              eruby = "erb",
              htmlangular = "html",
              templ = "html"
            },
            lint = {
              cssConflict = "warning",
              invalidApply = "error",
              invalidConfigPath = "error",
              invalidScreen = "error",
              invalidTailwindDirective = "error",
              invalidVariant = "error",
              recommendedVariantOrder = "warning"
            },
            validate = true
          }
        },
        root_dir = function(fname)
          return util.root_pattern(
            'tailwind.config.js',
            'tailwind.config.cjs',
            'tailwind.config.mjs',
            'tailwind.config.ts',
            'postcss.config.js',
            'postcss.config.cjs',
            'postcss.config.mjs',
            'postcss.config.ts'
          )(fname) or vim.fs.dirname(vim.fs.find('package.json', { path = fname, upward = true })[1]) or vim.fs.dirname(
            vim.fs.find('node_modules', { path = fname, upward = true })[1]
          ) or vim.fs.dirname(vim.fs.find('.git', { path = fname, upward = true })[1])
        end,
      }

      -- js
      require("lspconfig").ts_ls.setup {
        init_options = {
          hostInfo = "neovim",
          plugins = {
            {
              name = "@vue/typescript-plugin",
              -- location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
              -- location = "~/.local/share/fnm/node-versions/v22.12.0/installation/lib/node_modules/@vue/typescript-plugin",
              location = "~/.local/share/fnm/node-versions/v22.12.0/installation/lib/node_modules/@vue/language-server",
              languages = { "vue" },
            },
          },
          preferences = { disableSuggestions = true },
        },
        filetypes = {
          "javascript",
          "typescript",
          "typescriptreact",
          "javascriptreact",
          "javascript.jsx",
        },
        cmd = { "typescript-language-server", "--stdio" },
        root_dir = util.root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git"),
        single_file_support = true
      }

      -- volar
      -- require("lspconfig").volar.setup {
      --   cmd = { "vue-language-server", "--stdio" },
      --   root_dir = util.root_pattern("package.json"),
      --   --   -- add filetypes for typescript, javascript and vue
      --   filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
      --   init_options = {
      --     typescript = {
      --       -- replace with your global TypeScript library path
      --       tsdk = "/home/msousa/.local/share/fnm/node-versions/v22.12.0/installation/lib/node_modules/typescript/lib"
      --     },
      --     on_new_config = function(new_config, new_root_dir)
      --       local lib_path = vim.fs.find('node_modules/typescript/lib', { path = new_root_dir, upward = true })[1]
      --       if lib_path then
      --         new_config.init_options.typescript.tsdk = lib_path
      --       end
      --     end,
      --     vue = {
      --       -- disable hybrid mode
      --       hybridMode = false,
      --     },
      --   },
      -- }

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local c = vim.lsp.get_client_by_id(args.data.client_id)
          if not c then return end

          if vim.bo.filetype == "lua" then
            -- Format the current buffer on save
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = c.id })
              end,
            })
          end
        end,
      })
    end,
  }
}
