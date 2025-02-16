local on_attach = function(client, bufnr)
  -- auto format
  local extension = vim.bo.filetype
  if extension == "go" then
    -- use goimport instead of gofmt
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        local params = vim.lsp.util.make_range_params()
        params.context = { only = { "source.organizeImports" } }
        -- buf_request_sync defaults to a 1000ms timeout. Depending on your
        -- machine and codebase, you may want longer. Add an additional
        -- argument after params if you find that you have to write the file
        -- twice for changes to be saved.
        -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
        local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
        for cid, res in pairs(result or {}) do
          for _, r in pairs(res.result or {}) do
            if r.edit then
              local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
              vim.lsp.util.apply_workspace_edit(r.edit, enc)
            end
          end
        end
        vim.lsp.buf.format({ async = false })
      end,
    })
  else
    vim.api.nvim_create_autocmd("BufWritePre", {
      command = "lua vim.lsp.buf.format()",
      nested = true,
    })
  end
end

-- * override the configuration of LazyVim plugins
return {
  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {},
      },
    },
  },

  -- dadbod plugin
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod",                     lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },

  -- blink.cmp plugin
  {
    "saghen/blink.cmp",
    -- optional: provides snippets for the snippet source
    dependencies = {
      {
        "rafamadriz/friendly-snippets",
      },
      { "L3MON4D3/LuaSnip", version = "v2.*" },
    },

    -- use a release tag to download pre-built binaries
    version = "*",
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      -- See the full "keymap" documentation for information on defining your own keymap.
      keymap = {
        preset = "default",
        -- ["<CR>"] = { "accept", "fallback" },
        ["<Tab>"] = { "accept", "fallback" },
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },

        -- disable a keymap from the preset
        ["<C-e>"] = {},

        -- show with a list of providers
        ["<C-space>"] = {
          function(cmp)
            cmp.show({ providers = { "snippets" } })
          end,
        },

        -- control whether the next command will be run when using a function
        ["<C-n>"] = {
          function(cmp)
            if some_condition then
              return
            end   -- runs the next command
            return true -- doesn't run the next command
          end,
          "select_next",
        },
      },

      appearance = {
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- Useful for when your theme doesn't support blink.cmp
        -- Will be removed in a future release
        use_nvim_cmp_as_default = true,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = "mono",
      },

      snippets = { preset = "luasnip" },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "dadbod" },
        providers = {
          dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
        },
      },
      signature = {
        enabled = false,
        trigger = {
          blocked_trigger_characters = {},
          blocked_retrigger_characters = {},
          -- When true, will show the signature help window when the cursor comes after a trigger character when entering insert mode
          show_on_insert_on_trigger_character = true,
        },
        window = {
          min_width = 1,
          max_width = 100,
          max_height = 10,
          border = "padded",
          winblend = 0,
          winhighlight = "Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder",
          scrollbar = false, -- Note that the gutter will be disabled when border ~= 'none'
          -- Which directions to show the window,
          -- falling back to the next direction when there's not enough space,
          -- or another window is in the way
          direction_priority = { "n", "s" },
          -- Disable if you run into performance issues
          treesitter_highlighting = true,
        },
      },
    },
    opts_extend = { "sources.default" },
  },

  -- add languages and setup
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },

    opts = function(_, opts)
      local defaultConfig = {
        on_attach = function(client, bufnr)
          on_attach(client, bufnr)
        end,
        capabilities = require("blink.cmp").get_lsp_capabilities(),
      }

      opts.servers = {
        gopls = vim.list_extend(defaultConfig, {}),
        lua_ls = vim.list_extend(defaultConfig, {}),
        yamlls = vim.list_extend(defaultConfig, {}),
        ts_ls = vim.list_extend(defaultConfig, {
          init_options = {
            preferences = {
              includeInlayParameterNameHints = "all",
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
        }),
        denols = vim.list_extend(defaultConfig, {
          settings = {
            deno = {
              enable = true,
              unstable = true,
              inlayHints = {
                enumMemberValues = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                parameterNames = {
                  enabled = "all",
                  suppressWhenArgumentMatchesName = true,
                },
                parameterTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                variableTypes = {
                  enabled = true,
                  suppressWhenArgumentMatchesName = true,
                },
              },
            },
          },
        }),
      }
    end,

    init = function()
      require("lazyvim.util").lsp.on_attach(function(client, buffer)
        -- if client.name == "yamlls" then
        client.server_capabilities.documentFormattingProvider = true
        -- end

        vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", { buffer = buffer })
        vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { buffer = buffer })
        vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", { buffer = buffer })
        vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", { buffer = buffer })
        vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", { buffer = buffer })
        vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", { buffer = buffer })
        vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { buffer = buffer })
        vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", { buffer = buffer })
        vim.keymap.set(
          { "n", "x" },
          "<leader>f",
          "<cmd>lua vim.lsp.buf.format({async = true})<cr>",
          { buffer = buffer }
        )
        vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", { buffer = buffer })
      end)
    end,

    -- load config
    config = function(_, opts)
      -- Javascript and Typescript
      local files_in_pwd = vim.fn.readdir(vim.fn.getcwd())
      local should_init_deno_lsp = false
      for _, file_name in ipairs(files_in_pwd) do
        if file_name == "deno.json" then
          should_init_deno_lsp = true
        end
      end

      local lspconfig = require("lspconfig")
      for server, config in pairs(opts.servers) do
        -- passing config.capabilities to blink.cmp merges with the capabilities in your
        if should_init_deno_lsp and server == "ts_ls" then
          -- Skip ts_ls setup if deno.json exists
        elseif not should_init_deno_lsp and server == "denols" then
          -- Skip denols setup if deno.json doesn't exist
        else
          lspconfig[server].setup(config)
        end
      end
    end,
  },
}
