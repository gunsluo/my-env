-- * override the configuration of LazyVim plugins
return {
	-- vim-bookmarks plugin
	{ "MattesGroeger/vim-bookmarks" },

	{
		"nvim-telescope/telescope.nvim",
		tag = "v0.2.1",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzy-native.nvim",
			"nvim-telescope/telescope-live-grep-args.nvim",
			"tom-anders/telescope-vim-bookmarks.nvim",
		},
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
			{ "<leader>ma", "<cmd>Telescope vim_bookmarks all<cr>", desc = "Bookmarks (All)" },
			{ "ma", "<cmd>Telescope vim_bookmarks current_file<cr>", desc = "Bookmarks (File)" },
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
