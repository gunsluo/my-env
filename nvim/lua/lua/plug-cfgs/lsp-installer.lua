local function config()
	require("nvim-lsp-installer").setup {
		ui = {
			icons = {
				server_installed = "✓",
				server_pending = "➜",
				server_uninstalled = "✗"
			}
		}
	}
end

return {
  config = config,
}
