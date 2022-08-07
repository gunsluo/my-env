local function config()
  vim.o.background = "dark"
  vim.cmd[[colorscheme gruvbox]]
end

return {
  config = config,
}
