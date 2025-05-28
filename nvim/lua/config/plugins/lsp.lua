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

      -- enables all languages
      vim.lsp.enable({
        'zig',
        'intelephense',
        'tailwindcss',
        'ts_ls',
        'vue_ls',
        'goalngci_lint_ls',
        'gopls',
        'bashls',
        'lua_ls'
      }, true)

      -- lua
      vim.lsp.config('lua_ls', {
        on_init = function(client)
          if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if
                path ~= vim.fn.stdpath('config')
                and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
            then
              return
            end
          end

          client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
              -- Tell the language server which version of Lua you're using (most
              -- likely LuaJIT in the case of Neovim)
              version = 'LuaJIT',
              -- Tell the language server how to find Lua modules same way as Neovim
              -- (see `:h lua-module-load`)
              path = {
                'lua/?.lua',
                'lua/?/init.lua',
              },
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME
                -- Depending on the usage, you might want to add additional paths
                -- here.
                -- '${3rd}/luv/library'
                -- '${3rd}/busted/library'
              }
              -- Or pull in all of 'runtimepath'.
              -- NOTE: this is a lot slower and will cause issues when working on
              -- your own configuration.
              -- See https://github.com/neovim/nvim-lspconfig/issues/3189
              -- library = {
              --   vim.api.nvim_get_runtime_file('', true),
              -- }
            }
          })
        end,
        settings = {
          Lua = {}
        }
      })

      -- php intelephense
      vim.lsp.config('intelephense', {
        capabilities = capabilities,
        cmd = { "intelephense", "--stdio" },
        filetypes = { "php" },
        root_dir = function(bufnr, on_dir)
          local fname = vim.api.nvim_buf_get_name(bufnr)
          local cwd = assert(vim.uv.cwd())
          local root = vim.fs.root(fname, { 'composer.json', '.git' })

          -- prefer cwd if root is a descendant
          on_dir(root and vim.fs.relpath(cwd, root) and cwd)
        end,
      })

      -- tailwindcss
      vim.lsp.config('tailwindcss', {
        capabilities = capabilities,
        cmd = { "tailwindcss-language-server", "--stdio" },
        filetypes = {
          -- html
          'aspnetcorerazor',
          'astro',
          'astro-markdown',
          'blade',
          'clojure',
          'django-html',
          'htmldjango',
          'edge',
          'eelixir', -- vim ft
          'elixir',
          'ejs',
          'erb',
          'eruby', -- vim ft
          'gohtml',
          'gohtmltmpl',
          'haml',
          'handlebars',
          'hbs',
          'html',
          'htmlangular',
          'html-eex',
          'heex',
          'jade',
          'leaf',
          'liquid',
          'markdown',
          'mdx',
          'mustache',
          'njk',
          'nunjucks',
          'php',
          'razor',
          'slim',
          'twig',
          -- css
          'css',
          'less',
          'postcss',
          'sass',
          'scss',
          'stylus',
          'sugarss',
          -- js
          'javascript',
          'javascriptreact',
          'reason',
          'rescript',
          'typescript',
          'typescriptreact',
          -- mixed
          'vue',
          'svelte',
          'templ',
        },
        settings = {
          tailwindCSS = {
            validate = true,
            lint = {
              cssConflict = 'warning',
              invalidApply = 'error',
              invalidScreen = 'error',
              invalidVariant = 'error',
              invalidConfigPath = 'error',
              invalidTailwindDirective = 'error',
              recommendedVariantOrder = 'warning',
            },
            classAttributes = {
              'class',
              'className',
              'class:list',
              'classList',
              'ngClass',
            },
            includeLanguages = {
              eelixir = 'html-eex',
              elixir = 'phoenix-heex',
              eruby = 'erb',
              heex = 'phoenix-heex',
              htmlangular = 'html',
              templ = 'html',
            },
          },
        },
        before_init = function(_, config)
          if not config.settings then
            config.settings = {}
          end
          if not config.settings.editor then
            config.settings.editor = {}
          end
          if not config.settings.editor.tabSize then
            config.settings.editor.tabSize = vim.lsp.util.get_effective_tabstop()
          end
        end,
        workspace_required = true,
        root_dir = function(bufnr, on_dir)
          local root_files = {
            -- Generic
            'tailwind.config.js',
            'tailwind.config.cjs',
            'tailwind.config.mjs',
            'tailwind.config.ts',
            'postcss.config.js',
            'postcss.config.cjs',
            'postcss.config.mjs',
            'postcss.config.ts',
            -- Phoenix
            'assets/tailwind.config.js',
            'assets/tailwind.config.cjs',
            'assets/tailwind.config.mjs',
            'assets/tailwind.config.ts',
            -- Django
            'theme/static_src/tailwind.config.js',
            'theme/static_src/tailwind.config.cjs',
            'theme/static_src/tailwind.config.mjs',
            'theme/static_src/tailwind.config.ts',
            -- Rails
            'app/assets/stylesheets/application.tailwind.css',
            'app/assets/tailwind/application.css',
          }
          local fname = vim.api.nvim_buf_get_name(bufnr)
          root_files = util.insert_package_json(root_files, 'tailwindcss', fname)
          root_files = util.root_markers_with_field(root_files, { 'mix.lock' }, 'tailwind', fname)
          on_dir(vim.fs.dirname(vim.fs.find(root_files, { path = fname, upward = true })[1]))
        end,
      })

      -- js / ts / vue
      -- vim.lsp.config('ts_ls', {
      --   capabilities = capabilities,
      --   init_options = { hostInfo = 'neovim' },
      --   cmd = { 'typescript-language-server', '--stdio' },
      --   filetypes = {
      --     'javascript',
      --     'javascriptreact',
      --     'javascript.jsx',
      --     'typescript',
      --     'typescriptreact',
      --     'typescript.tsx',
      --     'vue',
      --   },
      --   root_markers = { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' },
      --   handlers = {
      --     -- handle rename request for certain code actions like extracting functions / types
      --     ['_typescript.rename'] = function(_, result, ctx)
      --       local client = assert(vim.lsp.get_client_by_id(ctx.client_id))
      --       vim.lsp.util.show_document({
      --         uri = result.textDocument.uri,
      --         range = {
      --           start = result.position,
      --           ['end'] = result.position,
      --         },
      --       }, client.offset_encoding)
      --       vim.lsp.buf.rename()
      --       return vim.NIL
      --     end,
      --   },
      --   on_attach = function(client)
      --     -- ts_ls provides `source.*` code actions that apply to the whole file. These only appear in
      --     -- `vim.lsp.buf.code_action()` if specified in `context.only`.
      --     vim.api.nvim_buf_create_user_command(0, 'LspTypescriptSourceAction', function()
      --       local source_actions = vim.tbl_filter(function(action)
      --         return vim.startswith(action, 'source.')
      --       end, client.server_capabilities.codeActionProvider.codeActionKinds)
      --
      --       vim.lsp.buf.code_action({
      --         context = {
      --           only = source_actions,
      --         },
      --       })
      --     end, {})
      --   end,
      -- })

      -- vuels
      vim.lsp.config('vue_ls', {
        capabilities = capabilities,
        cmd = { 'vue-language-server', '--stdio' },
        filetypes = { 'javascript',
          'javascriptreact',
          'javascript.jsx',
          'typescript',
          'typescriptreact',
          'typescript.tsx',
          'vue'
        },
        init_options = {
          tsdk = '/home/mau/.local/share/fnm/node-versions/v22.12.0/installation/lib/node_modules/typescript/lib',
          vue = {
            hybridMode = false,
          }
        },
        root_markers = { 'package.json' },
        before_init = function(_, config)
          if config.init_options and config.init_options.typescript and config.init_options.typescript.tsdk == '' then
            config.init_options.typescript.tsdk = util.get_typescript_server_path(config.root_dir)
          end
        end,
      })

      -- golang ci
      vim.lsp.config('goalngci_lint_ls', {
        capabilities = capabilities,
        cmd = { 'golangci-lint-langserver' },
        filetypes = { 'go', 'gomod' },
        init_options = {
          command = { 'golangci-lint', 'run', '--output.json.path=stdout', '--show-stats=false' },
        },
        root_markers = {
          '.golangci.yml',
          '.golangci.yaml',
          '.golangci.toml',
          '.golangci.json',
          'go.work',
          'go.mod',
          '.git',
        },
        before_init = function(_, config)
          -- Add support for golangci-lint V1 (in V2 `--out-format=json` was replaced by
          -- `--output.json.path=stdout`).
          local v1
          -- PERF: `golangci-lint version` is very slow (about 0.1 sec) so let's find
          -- version using `go version -m $(which golangci-lint) | grep '^\smod'`.
          if vim.fn.executable 'go' == 1 then
            local exe = vim.fn.exepath 'golangci-lint'
            local version = vim.system({ 'go', 'version', '-m', exe }):wait()
            v1 = string.match(version.stdout, '\tmod\tgithub.com/golangci/golangci%-lint\t')
          else
            local version = vim.system({ 'golangci-lint', 'version' }):wait()
            v1 = string.match(version.stdout, 'version v?1%.')
          end
          if v1 then
            config.init_options.command = { 'golangci-lint', 'run', '--out-format', 'json' }
          end
        end,
      })

      local mod_cache = nil

      ---@param fname string
      ---@return string?
      local function get_root(fname)
        if mod_cache and fname:sub(1, #mod_cache) == mod_cache then
          local clients = vim.lsp.get_clients { name = 'gopls' }
          if #clients > 0 then
            return clients[#clients].config.root_dir
          end
        end
        return vim.fs.root(fname, 'go.work') or vim.fs.root(fname, 'go.mod') or vim.fs.root(fname, '.git')
      end

      vim.lsp.config('gopls', {
        capabilities = capabilities,
        cmd = { 'gopls' },
        filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
        root_dir = function(bufnr, on_dir)
          local fname = vim.api.nvim_buf_get_name(bufnr)
          -- see: https://github.com/neovim/nvim-lspconfig/issues/804
          if mod_cache then
            on_dir(get_root(fname))
            return
          end
          local cmd = { 'go', 'env', 'GOMODCACHE' }
          vim.system(cmd, { text = true }, function(output)
            if output.code == 0 then
              if output.stdout then
                mod_cache = vim.trim(output.stdout)
              end
              on_dir(get_root(fname))
            else
              vim.schedule(function()
                vim.notify(('[gopls] cmd failed with code %d: %s\n%s'):format(output.code, cmd, output.stderr))
              end)
            end
          end)
        end,
      })

      -- bash
      vim.lsp.config('bashls', {
        capabilities = capabilities,
        cmd = { 'bash-language-server', 'start' },
        filetypes = { 'bash', 'sh' },
        root_markers = { '.git' },
        settings = {
          bashIde = {
            globPattern = '*@(.sh|.inc|.bash|.command)',
          },
        },
      })

      -- zig
      vim.lsp.config('zig', {
        capabilities = capabilities,
        cmd = { "zls" },
        filetypes = { "zig", "zir" },
        root_markers = { "zls.json", "build.zig", ".git" },
      })

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
