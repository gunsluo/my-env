-- * override the configuration of LazyVim plugins
return {
	{
		"Shatur/neovim-session-manager",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local Path = require("plenary.path")
			local session_config = require("session_manager.config")

			require("session_manager").setup({
				sessions_dir = Path:new(vim.fn.stdpath("data"), "sessions"),
				autoload_mode = session_config.AutoloadMode.CurrentDir,
				autosave_last_session = true,
				autosave_ignore_not_normal = true,
				autosave_ignore_dirs = {},
				autosave_ignore_filetypes = {
					"gitcommit",
					"gitrebase",
				},
				autosave_ignore_buftypes = {},
				autosave_only_in_session = false, -- only save if a session is already active
				max_path_length = 80,
			})

			local config_group = vim.api.nvim_create_augroup("MyConfigGroup", { clear = true })

			-- Re-open nvim-tree after a session is loaded
			vim.api.nvim_create_autocmd("User", {
				pattern = "SessionLoadPost",
				group = config_group,
				callback = function()
					pcall(function()
						require("nvim-tree.api").tree.toggle(false, true)
					end)
				end,
			})

			-- -- Auto save session
			-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
			-- 	callback = function()
			-- 		for _, buf in ipairs(vim.api.nvim_list_bufs()) do
			-- 			-- Don't save while there's any 'nofile' buffer open.
			-- 			if vim.api.nvim_get_option_value("buftype", { buf = buf }) == "nofile" then
			-- 				return
			-- 			end
			-- 		end
			-- 		require("session_manager").save_current_session()
			-- 	end,
			-- })
		end,
	},
}
