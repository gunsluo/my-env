-- * override the configuration of LazyVim plugins
return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
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
			sync_install = false,
			auto_install = false,
			ignore_install = { "markdown", "markdown_inline" },
			highlight = {
				enable = true,
				disable = function(lang, buf)
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
			},
		},
	},
}
