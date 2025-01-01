-- * override the configuration of LazyVim plugins
return {
  -- vim-bookmarks plugin
  { "MattesGroeger/vim-bookmarks" },

  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    -- or                              , branch = '0.1.x',
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzy-native.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
      "tom-anders/telescope-vim-bookmarks.nvim",
    },
    config = function()
      require("telescope").setup({
        extensions = {
          fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
          },
        },
      })
      require("telescope").load_extension("fzy_native")
      require("telescope").load_extension("live_grep_args")
      require("telescope").load_extension("vim_bookmarks")
    end,
  },
}
