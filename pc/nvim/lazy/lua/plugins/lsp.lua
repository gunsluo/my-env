local function make_on_attach(extra)
  return function(client, bufnr)
    -- Go: use goimports instead of gofmt
    if vim.bo[bufnr].filetype == "go" then
      local augroup = vim.api.nvim_create_augroup("GoImports_" .. bufnr, { clear = true })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          local params = vim.lsp.util.make_range_params()
          params.context = { only = { "source.organizeImports" } }
          local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
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
      local augroup = vim.api.nvim_create_augroup("LspFormat_" .. bufnr, { clear = true })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
    end

    -- Only enable formatting for servers that support it
    if client.server_capabilities.documentFormattingProvider then
      vim.keymap.set(
        { "n", "x" },
        "<leader>f",
        "<cmd>lua vim.lsp.buf.format({ async = true })<cr>",
        { buffer = bufnr }
      )
    end

    -- LSP keymaps
    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", { buffer = bufnr })
    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { buffer = bufnr })
    vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", { buffer = bufnr })
    vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", { buffer = bufnr })
    vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", { buffer = bufnr })
    vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", { buffer = bufnr })
    vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { buffer = bufnr })
    vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", { buffer = bufnr })
    vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", { buffer = bufnr })

    if extra then
      extra(client, bufnr)
    end
  end
end

local function find_deno_json()
  return vim.fn.findfile("deno.json", vim.fn.getcwd() .. ";") ~= ""
end

return {
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
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },

  {
    "saghen/blink.cmp",
    dependencies = {
      { "rafamadriz/friendly-snippets" },
      { "L3MON4D3/LuaSnip",            version = "v2.*" },
    },
    version = "*",
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = "default",
        ["<Tab>"] = { "accept", "fallback" },
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<C-e>"] = {},
        ["<C-space>"] = {
          function(cmp)
            cmp.show({ providers = { "snippets" } })
          end,
        },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },
      snippets = { preset = "luasnip" },
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "dadbod" },
        providers = {
          dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
        },
      },
      signature = { enabled = false },
    },
    opts_extend = { "sources.default" },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },

    opts = function(_, opts)
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      local function server_config(extra_on_attach, extra_opts)
        return vim.tbl_deep_extend("force", {
          on_attach = make_on_attach(extra_on_attach),
          capabilities = capabilities,
        }, extra_opts or {})
      end

      opts.servers = {
        pyright = server_config(),
        gopls = server_config(),
        lua_ls = server_config(),
        yamlls = server_config(),
        ts_ls = server_config(nil, {
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
        denols = server_config(nil, {
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

      return opts
    end,

    config = function(_, opts)
      local should_use_deno = find_deno_json()
      local lspconfig = require("lspconfig")

      for server, config in pairs(opts.servers) do
        if should_use_deno and server == "ts_ls" then
          -- skip ts_ls when deno.json is present
        elseif not should_use_deno and server == "denols" then
          -- skip denols when deno.json is absent
        else
          lspconfig[server].setup(config)
        end
      end
    end,
  },
}
