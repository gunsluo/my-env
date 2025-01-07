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
    init = function()
      require("lazyvim.util").lsp.on_attach(function(client, buffer)
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { buffer = buffer })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { buffer = buffer })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { buffer = buffer })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { buffer = buffer })

        vim.api.nvim_set_keymap("n", "<leader>ma", "<Cmd>Telescope vim_bookmarks all<CR>", { noremap = true })
        vim.api.nvim_set_keymap("n", "ma", "<Cmd>Telescope vim_bookmarks current_file<CR>", { noremap = true })
      end)
    end,

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
