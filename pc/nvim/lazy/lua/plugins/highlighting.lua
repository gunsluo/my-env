-- * override the configuration of LazyVim plugins
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "go",
        "gomod",
        "gosum",
        "gowork",
        "lua",
        "vim",
        "python",
        "vimdoc",
        "gitignore",
        "html",
        "tsx",
        "vue",
        "json",
        "yaml",
        "xml",
        "sql",
        "helm",
      },
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = false,

      -- List of parsers to ignore installing (or "all")
      ignore_install = { "markdown", "markdown_inline" },

      ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
      -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

      highlight = {
        enable = true,

        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser)
        -- list of language that will be disabled
        -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },
    },
    build = function()
      -- local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      -- ts_update()
    end,
  },

  -- remove markdown & markdown_inline in default
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = vim.tbl_filter(function(parser)
        return not vim.tbl_contains({ "markdown", "markdown_inline" }, parser)
      end, opts.ensure_installed)
    end,
  },
}
