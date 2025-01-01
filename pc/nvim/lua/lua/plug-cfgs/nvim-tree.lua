local function setup()
	-- vim.api.nvim_set_keymap('n', '<C-m>', ':NvimTreeToggle<CR>', { noremap = true })
	vim.api.nvim_set_keymap("n", "<C-/>", ":NvimTreeFocus<CR>", { noremap = true })
end

local function config()
	-- local status_ok, nvim_tree = pcall(require, "nvim-tree")
	-- if not status_ok then
	--   vim.notify("nvim-tree not found!")
	--   return
	-- end

	require("nvim-tree").setup({
		sort = {
			sorter = "case_sensitive",
		},
		view = {
			width = 30,
		},
		renderer = {
			group_empty = true,
		},
		filters = {
			dotfiles = true,
		},
		update_focused_file = {
			enable = true,
			update_root = true,
			ignore_list = {},
		},
		-- sync_root_with_cwd = true,
		-- respect_buf_cwd = true,
		-- actions = {
		--   use_system_clipboard = true,
		--   change_dir = {
		--     enable = true,
		--     global = false,
		--     restrict_above_cwd = false,
		--   },
		--   open_file = {
		--     quit_on_open = false,
		--     resize_window = true,
		--     window_picker = {
		--       enable = true,
		--       chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
		--       exclude = {
		--         filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
		--         buftype = { "nofile", "terminal", "help" },
		--       },
		--     },
		--   },
		-- },
	})

	local api = require("nvim-tree.api")
	api.events.subscribe(api.events.Event.FileCreated, function(file)
		vim.cmd("edit " .. file.fname)
	end)

	vim.api.nvim_create_autocmd("BufEnter", {
		command = "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif",
		nested = true,
	})
end

return {
	setup = setup,
	config = config,
}
